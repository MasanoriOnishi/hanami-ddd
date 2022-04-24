ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION

ENV APP_ROOT=/app
RUN mkdir $APP_ROOT
RUN mkdir -p /var/log/app

RUN apt-get update -y -qq \
  && apt-get install -y -qq \
  build-essential \
  default-libmysqlclient-dev

# app
WORKDIR $APP_ROOT

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle config build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"
RUN echo 'gem: --no-document' > ~/.gemrc \
  && bundle install

COPY . .