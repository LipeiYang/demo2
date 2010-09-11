namespace :deploy do
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
    iso_date = Time.now.strftime('%Y-%m-%dT%H%M%S')

    confirm('This will delete the existed bundle on server.')

    puts "Backing up ..."
    Dir.chdir(File.join(File.dirname(__FILE__), *%w[.. .. backups])) do
      run "heroku bundles:destroy deploybackup" if `heroku bundles` =~ /deploybackup/
      run "heroku bundles:capture deploybackup"
      puts " ... waiting for Heroku"
      while sleep(5) && `heroku bundles` !~ /complete/
        puts " ... still waiting"
      end
      puts " ... downloading backup"
      run "heroku bundles:download deploybackup"
      run "mv #{PRODUCTION_APP}{,_#{iso_date}}.tar.gz"
    end
  end
  
end
