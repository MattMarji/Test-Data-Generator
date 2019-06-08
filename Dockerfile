FROM ruby:2.4.2
WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .