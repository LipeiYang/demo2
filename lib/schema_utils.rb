   module SchemaUtils
        def self.add_schema_to_path(schema)
            conn = ActiveRecord::Base.connection
            conn.execute "SET search_path TO #{schema}, #{conn.schema_search_path}"
        end

        def self.reset_search_path
            conn = ActiveRecord::Base.connection
            conn.execute "SET search_path TO #{conn.schema_search_path}"
        end

        def self.create_and_migrate_schema(schema_name)
            conn = ActiveRecord::Base.connection

            schemas = conn.select_values("select * from pg_namespace where nspname != 'information_schema' AND nspname NOT LIKE 'pg%'")

            if schemas.include?(schema_name)
                tables = conn.tables
                Rails.logger.info "#{schema_name} exists already with these tables #{tables.inspect}"
            else
                Rails.logger.info "About to create #{schema_name}"
                conn.execute "create schema #{schema_name}"
            end

            # Save the old search path so we can set it back at the end of this method
            old_search_path = conn.schema_search_path

            # Tried to set the search path like in the methods above (from Guy Naor)
            # [METHOD 1]: conn.execute "SET search_path TO #{schema_name}"
            # But the connection itself seems to remember the old search path.
            # When Rails executes a schema it first asks if the table it will load in already exists and if :force => true. 
            # If both true, it will drop the table and then load it. 
            # The problem is that in the METHOD 1 way of setting things, ActiveRecord::Base.connection.schema_search_path still returns $user,public.
            # That means that when Rails tries to load the schema, and asks if the tables exist, it searches for these tables in the public schema.
            # See line 655 in Rails 2.3.5 activerecord/lib/active_record/connection_adapters/postgresql_adapter.rb
            # That's why I kept running into this error of the table existing when it didn't (in the newly created schema).
            # If used this way [METHOD 2], it works. ActiveRecord::Base.connection.schema_search_path returns the string we pass it.
            conn.schema_search_path = schema_name

            # Directly from databases.rake. 
            # In Rails 2.3.5 databases.rake can be found in railties/lib/tasks/databases.rake
            file = "#{Rails.root}/db/schema.rb"
            if File.exists?(file)
                Rails.logger.info "About to load the schema #{file}"
                load(file)
            else
                abort %{#{file} doesn't exist yet. It's possible that you just ran a migration!}
            end

            Rails.logger.info "About to set search path back to #{old_search_path}."
            conn.schema_search_path = old_search_path
        end
    end         