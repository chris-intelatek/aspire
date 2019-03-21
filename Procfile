web: bin/rails server -p $PORT -e $RAILS_ENV
release: bundle exec rake db:schema:load
release: bundle exec rake db:migrate