#!/usr/bin/env bash
# exit on error
set -o errexit

# Force RAILS_ENV to production during build
export RAILS_ENV=production
export RAILS_MASTER_KEY=${RAILS_MASTER_KEY}

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed
