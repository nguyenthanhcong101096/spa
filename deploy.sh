#!/bin/bash

PROJECT_PATH=/home/spa

cd  ${PROJECT_PATH}

rm -f ${PROJECT_PATH}/tmp/pids/puma.pid
rm -f ${PROJECT_PATH}/tmp/pids/puma.state
rm -f ${PROJECT_PATH}/tmp/sockets/puma.sock

kill -9 $(lsof -i:3000 -t)

bundle check || bundle install

bundle exec rails db:migrate

rails s
