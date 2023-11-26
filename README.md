# README

Requirement
- docker
- docker-compose
- rails ^6.0.3
- ruby 3.0.3

## How to setup

### Setup server
1. Install git
2. Install rbenv https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04
3. rbenv install 3.0.3
4. Install docker [https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-)
5. Install docker-compose https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04

### Install project
1. Git Clone
2. copy .env file from .env.example
3. docker-compose build
4. copy master.key from master-example.key
5. docker-compose up --detach
6. docker-compose exec web rails db:setup
7. docker-compose exec web rails db:seed

### How to test
1. ~


### Documentation

User login
1. localhost:3000/login

API User login
1. localhost:3000/api/session [POST]
