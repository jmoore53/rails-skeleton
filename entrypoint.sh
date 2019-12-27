export RAILS_ENV=production

if [ ! -f ./config/credentials/production.key ]; then
    mv ./config/credentials/production.yml.enc ./config/credentials/production.yml.bak
    mv ./config/credentials/sample.key ./config/credentials/production.key
    mv ./config/credentials/sample.yml.enc ./config/credentials/production.yml.enc
fi

bundle exec rake db:exists && rake db:migrate || rake db:setup

if [[ -z "${ADMIN_EMAIL}" ]] || [[ -z "${ADMIN_PASSWORD}" ]]; then 
    echo "Admin email or password not set, not seeding!"
else
    bundle exec rake db:seed:single SEED=admin EMAIL=$ADMIN_EMAIL PASSWORD=$ADMIN_PASSWORD
fi

bundle exec puma -C config/puma.rb -e production
