# Base image:
FROM ruby:slim

MAINTAINER Bram van Osta <bramvanosta@gmail.com>
 
# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

COPY Gemfile* /var/www/html/api/

WORKDIR /var/www/html/api/

RUN bundle install

# The default command that gets ran will be to start the Puma server.
CMD bundle exec puma -C config/puma.rb
