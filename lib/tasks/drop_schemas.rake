namespace :db do
  desc 'Drop all postgres schemas'
  task :drop_schemas => :environment do
    # get all schemas
    establish_connection
    schemas = get_schemas
    puts "drop schemas: #{schemas.inspect}"
    # drop each schema
    schemas.each do |schema|
      puts "drop schema: #{schema}"
      ActiveRecord::Base.connection.execute "DROP SCHEMA #{schema} CASCADE"
    end
    # create public schema if it is not exist
    unless get_schemas.include?('public')
      puts "create schema: public"
      ActiveRecord::Base.connection.execute "CREATE SCHEMA public"
    end
  end
  
  def establish_connection
    env = "#{RAILS_ENV}"
    config = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(config[env])
  end
  
  def get_schemas
    ActiveRecord::Base.connection.select_values("select * from pg_namespace where nspname != 'information_schema' AND nspname NOT LIKE 'pg%'")
  end
end