# Create a Jekyll container from a Ruby Alpine image
# Credit to https://github.com/BillRaymond/my-jekyll-docker-website

FROM ruby:2.7-alpine3.15
# FROM ruby:3.0.3-alpine3.15

WORKDIR /workspaces/site

# Add Jekyll dependencies to Alpine
RUN apk update
RUN apk add --no-cache build-base gcc cmake git

# Copy Gemfiles or build them
# build
# RUN bundle init
# copy
COPY Gemfile* ./

# Update the Ruby bundler and install Jekyll
RUN gem update bundler
RUN gem install bundler jekyll
#RUN gem install "just-the-docs" 
RUN gem install just-the-docs --version '0.4.0.rc3'
RUN gem update

RUN bundle add jekyll --version "~>3.9.2"
RUN bundle add webrick

RUN bundle install
RUN bundle update

# build the new Jekyll site framework
# RUN bundle exec jekyll new --force --skip-bundle .
# build the new website from make instead using `make new`