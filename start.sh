#!/bin/bash
bundle check || bundle install
bundle exec rails db:create db:migrate
bundle exec puma -C config/puma.rb