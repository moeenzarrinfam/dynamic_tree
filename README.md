# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.6.3

* System dependencies: Mongodb

* Configuration: provide master.key and environment vailables

* Database creation: you should create databases inside database console (mongo)

* How to run the test suite: `bundle exec rspec`

* Deployment instructions: #TODO

* ...

# RUNNING DOCKER

## REQUIRMENTS
you only need install docker-ce and docker-compose on your computer for this guide.
[docker installation](https://docs.docker.com/install)

----
## CONFIG FILES
create config files:

    cp docker/docker-compose.sample.yml docker/docker-compose.yml
    cp docker/docker.sample.env docker/docker.env

these are configure files and have default values but they will work. you should modify them when you want deploy app.

----
## DATABASE
a sample mongo database is configured in docker-compose.yml but you can remove it and connect your app to another database.