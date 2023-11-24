FROM ruby:3.0.3

RUN apt-get update -qq
# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs &&\
#   curl -sL https://deb.nodesource.com/setup_14.x | bash

# ARG POSTGRES_USER
# ARG POSTGRES_PASSWORD
# ARG REDIS_PASSWORD
#
# RUN echo ${REDIS_PASSWORD}
# RUN echo ABC2511

# ENV POSTGRES_USER=${POSTGRES_USER}
# ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
# ENV REDIS_PASSWORD=${REDIS_PASSWORD}

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV REDIS_PASSWORD=ABC2511

RUN mkdir /app
WORKDIR /app

EXPOSE 3000

COPY Gemfile .
COPY Gemfile.lock .
RUN gem update bundler
RUN bundle install

# COPY package.json .
# COPY yarn.lock .
# RUN yarn install

CMD rails server -b 0.0.0.0
