# Meal Plan Web App Setup
Based on:
  * https://coderjourney.com/learning-rails-project-setup-and-planning/
## Basic Project Setup
```
docker run --rm i-ti -v $PWD:/usr/src -w /usr/src ruby:2.3.1 bash
gem install rails
rails new meal_plan --skip-turbolinks --skip-spring -d postgresql --skip-bundle --skip-test
```
Modify Gemfile, database.yml and setup Dockerfile and docker-compose.yml
```
docker-compose run --rm app rake db:create db:migrate
```
## Part 2 - User Sign Up and Authentication
Basically need to do the main commands every time you modify the Gemfile
```
# docker-compose build && docker-compose run --rm app bash
docker-compose stop && docker-compose build && docker-compose up -d
docker-compose run --rm app bash
```
Then inside the container
```
rails generate clearance:install
```
```
rake routes
```
Since initializer was involved - need to stop and start server again
```
docker-compose stop && docker-compose up -d
```
Look at available routes
```
docker-compose run --rm app rake routes
```


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
