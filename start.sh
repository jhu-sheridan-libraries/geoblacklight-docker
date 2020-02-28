#!/bin/bash
set -m 

bin/rails db:migrate RAILS_ENV=development

env 

sleep 15

bundle exec rails s -b 0.0.0.0