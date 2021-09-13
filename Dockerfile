FROM ruby:3.0.2

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq \
  && apt-get install -y build-essential libpq-dev nodejs yarn \
  && gem install bundler \
  && bundle install

ADD . /myapp
