FROM ruby:3.4.1-alpine3.21

WORKDIR /sample-google-custom-search-api

RUN apk update && \
    apk add --no-cache \
      build-base \
      libxml2-dev \
      libxslt-dev \
      linux-headers \
      libpq \
      mysql-dev \
      shared-mime-info && \
    gem install bundler

COPY . .

RUN bundle config set --global force_ruby_platform true && \
    bundle install
