#!/usr/bin/env bash

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
rbenv_path='export PATH="$HOME/.rbenv/bin:$PATH"'
eval $rbenv_path
echo $rbenv_path >> ~/.bashrc
rbenv_init='eval "$(rbenv init -)"'
eval $rbenv_init
echo $rbenv_init >> ~/.bashrc
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

cd /vagrant
ruby_version=`cat .ruby-version`
rbenv install $ruby_version 
rbenv rehash
rbenv global $ruby_version 
