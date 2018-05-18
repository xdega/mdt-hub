#!/bin/bash
cd /var/www/html
rm tmp/pids/server.pid || true
mailcatcher --http-ip=0.0.0.0
rails db:setup
rails s
