#!/bin/bash
set -m 

echo "ENV - AWS environment - " $environment

pwd
ls

envsubst < config/database.yml.template > config/database.yml
envsubst < .env.development.template  > .env.development

envsubst < config/database.yml.template > config/database.yml
envsubst < .env.development.template  > .env.development

bin/rails db:migrate RAILS_ENV=development

env 

sleep 15

bundle exec rails s -b 0.0.0.0