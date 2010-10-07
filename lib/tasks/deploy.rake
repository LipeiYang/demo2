namespace :deploy do
  
  PRODUCTION_APP = 'zhangben'
  BACKUP_DIR = 'C:\Documents and Settings\Leopard\My Documents\My Dropbox\heroku_backup'
  
  def run(*cmd)
    system(*cmd)
    raise "Command #{cmd.inspect} failed!" unless $?.success?
  end 

  def confirm(message)
    print "\n#{message}\nAre you sure? [Yn] "
    raise 'Aborted' unless STDIN.gets.chomp == 'Y'
  end

  desc "Backup Bundle"
  task :backup do
    iso_date = Time.now.strftime('%Y-%m-%d_%H%M%S')

    confirm('This will delete the existed bundle on server.')

    puts "Backing up ..."
    # Dir.chdir(File.join(File.dirname(__FILE__), *%w[.. .. backups])) do
    Dir.chdir(BACKUP_DIR) do
      run "heroku bundles:destroy deploybackup --app #{PRODUCTION_APP}" if `heroku bundles --app #{PRODUCTION_APP}` =~ /deploybackup/
      run "heroku bundles:capture deploybackup --app #{PRODUCTION_APP}"
      puts " ... waiting for Heroku"
      while sleep(5) && `heroku bundles --app #{PRODUCTION_APP}` !~ /complete/
        puts " ... still waiting"
      end
      puts " ... downloading backup"
      run "heroku bundles:download deploybackup --app #{PRODUCTION_APP}"
      run "mv {#{PRODUCTION_APP},#{PRODUCTION_APP}_#{iso_date}}.tar.gz"
    end
  end
  
  desc "Database Migration"
  task :migrate do
    puts 'Running db:migrate ...'
    run `heroku rake db:migrate`
    puts 'Running db:migrate_schemas ...'
    run `heroku rake db:migrate_schemas`
  end  
end
