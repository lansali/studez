# Studez
Connections for students in higher learning

## Running the application
To spin up the app use
- `yarn install`
- `gem install foreman`
- `foreman start -f Procfile.dev`

Visit `http://localhost:5000/` where the app is live.

## Resetting the application
In 3 separate terminals run these commands in their order:
- `redis-server`
- `elasticsearch`
- `rake db:drop && rake db:setup`
Then turn off redis and elasticsearch.

## Author
Sylvance Kerandi

## Acknowldegements
- https://medium.com/forest-admin/rails-migrations-tricks-guide-code-cheatsheet-included-dca935354f22
- https://medium.com/@guilhermepejon/how-to-install-bootstrap-4-3-in-a-rails-6-app-using-webpack-9eae7a6e2832
- https://www.chrisjmendez.com/2016/12/18/populating-your-database-in-rails-using-seeds/
- https://dev.to/codicacom/how-to-implement-elasticsearch-in-a-rails-web-app-part-2-2c36
- https://iridakos.com/programming/2017/12/03/elasticsearch-and-rails-tutorial
- https://www.elastic.co/guide/en/elasticsearch/reference/7.5/brew.html
