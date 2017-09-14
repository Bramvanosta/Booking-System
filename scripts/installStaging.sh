#!/usr/bin/env bash

# Go to the installation folder
cd /var/www/booking-system/

echo "### Print dependency versions ###"
echo "node: `node -v`"
echo "npm: `npm -v`"
echo "ruby: `ruby -v`"
echo "rails: `rails -v`"

# Get the latest version via git
echo "### Getting the latest version via git ###"
git fetch origin
git reset origin/master --hard

# Install Front-end dependencies for Angular
echo "### Installing Front-end depenencies for Angular ###"
cd client
yarn

# Build the staging environment
echo "### Building the Staging environment for Angular ###"
npm run build:staging

# Install Back-end dependencies for Rails
echo "### Installing Back-end dependencies for Rails ###"
cd ../api
RAILS_ENV=staging bundle install

# Setup Rails database
echo "### Setting up Rails database ###"
RAILS_ENV=staging rails db:create
RAILS_ENV=staging rails db:migrate

# Populate Rails database
echo "### Populating this Rails database ###"
RAILS_ENV=staging rails db:populate
