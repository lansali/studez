namespace :db do
    namespace :import do
      desc 'Import Heroku Staging database locally'
      task :staging do
        import_db('staging', 'YOUR_STAGING_HEROKU_APP_HERE')
      end
  
      desc 'Import Heroku Production database locally'
      task :production do
        import_db('production', 'YOUR_PRODUCTION_HEROKU_APP_HERE')
      end
  
      # Creates a unique database dump based on the current time and specified environment.
      def import_db(environment, heroku_app_name)
        puts("Importing #{environment} database locally...")
        file = "tmp/#{environment}-#{date}.dump"
        dump_local
        capture_and_download_heroku_db(heroku_app_name)
        `mv latest.dump #{file}`
        import_locally(file)
        run_migrations
        puts("#{environment} database successfully imported")
      end
  
      # Returns the readable date in YYYY-MM-DD with an
      # appended integer time to make the filename unique.
      def date
        "#{Time.now.to_date.to_s}-#{Time.now.to_i}"
      end
  
      # Returns the current machine's user for use with PG commands
      def user
        `whoami`.strip
      end
  
      # Creates and downloads a Heroku database back-up.
      # Requires the Heroku toolchain to be installed and setup.
      def capture_and_download_heroku_db(app)
        `heroku pg:backups:capture --app #{app}`
        `heroku pg:backups:download --app #{app}`
      end
  
      # Creates a back-up of your current local development
      # database in case you want to restore it.
      def dump_local
        `pg_dump -Fc --no-acl --no-owner -h localhost -U #{user} YOUR_LOCAL_DB_NAME_HERE > tmp/development-#{date}.dump`
      end
  
      # Imports the downloaded database dump into your local development database.
      def import_locally(file)
        `pg_restore --verbose --clean --no-acl --no-owner -h localhost -U #{user} -d YOUR_LOCAL_DB_NAME_HERE #{file}`
      end
  
      # Runs migrations against the just imported database dump from Heroku.
      def run_migrations
        `bin/rake db:migrate`
      end
    end
  end
