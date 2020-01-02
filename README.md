# Studez
Connections for students in higher learning

## Running the application
To spin up the app use
- `yarn install`
- `gem install foreman`
- `foreman start -f Procfile.dev`

Visit `http://localhost:5000/` where the app is live.

## Resetting the application
Run:
- `rails db:drop && rails db:create && rails db:migrate && rails db:setup`

## Author
Sylvance Kerandi

## Acknowldegements
- https://medium.com/forest-admin/rails-migrations-tricks-guide-code-cheatsheet-included-dca935354f22
- https://medium.com/@guilhermepejon/how-to-install-bootstrap-4-3-in-a-rails-6-app-using-webpack-9eae7a6e2832
- https://www.chrisjmendez.com/2016/12/18/populating-your-database-in-rails-using-seeds/
- https://nandovieira.com/using-postgresql-and-hstore-with-rails
- https://azukidigital.com/blog/2015/hstore-in-rails-4/
- https://www.engineyard.com/blog/using-postgresql-hstore-in-a-rails-application-on-engine-yard-cloud
- https://mikecoutermarsh.com/using-hstore-with-rails-4/
