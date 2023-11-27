FROM ruby:3.0.3

RUN apt-get update -qq

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

RUN mkdir /app
WORKDIR /app

EXPOSE 3000

COPY Gemfile .
COPY Gemfile.lock .
RUN gem update bundler
RUN bundle install

CMD rails server -b 0.0.0.0
