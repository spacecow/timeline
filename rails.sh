#!/usr/bin/env bash

cd /vagrant

rbenv_path='export PATH="$HOME/.rbenv/bin:$PATH"'
eval $rbenv_path
rbenv_init='eval "$(rbenv init -)"'
eval $rbenv_init

gem install bundler
rbenv rehash
bundle
cp config/database.yml.sample config/database.yml
rake db:create:all
rake db:migrate
RAILS_ENV=test rake db:migrate
