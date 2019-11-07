

export RAILS_ENV=production

bundle exec rake db:exists && rake db:migrate || rake db:setup

bundle exec puma -C config/puma.rb -e production
