FROM ruby:3.0.2

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN apt-get update -qq \
  && apt-get install -y build-essential libpq-dev \
  && gem install bundler -v 2.2.26 \
  && bundle install

ADD . /myapp
