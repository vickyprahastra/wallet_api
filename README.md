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

## Documentation

1. User login

    - localhost:3000/login

2. User logout

    - localhost:3000/logout

3. User details

    - localhost:3000


### API

1. API user login

    - [POST] localhost:3000/api/session

| Keys            | Values         |
| --------------- | -------------- |
| user[username]  | user1          |
| user[password]  | password       |

2. API user logout

    - [DELETE] localhost:3000/api/session

3. API user transfer

    - [POST] localhost:3000/api/transfer

| Keys                      | Values     |
| ------------------------- | ---------- |
| transaction[receiver_id]  | user_id    |
| transaction[amount]       | amount     |

4. API user withdraw

    - [POST] localhost:3000/api/withdraw

| Keys                      | Values     |
| ------------------------- | ---------- |
| transaction[amount]       | amount     |
