# Meal Plan Web App Setup
Based on:
  * https://coderjourney.com/learning-rails-project-setup-and-planning/
# Basic Commands for Container
Enter a disposable interactive shell
```
docker-compose run --rm --user "$(id -u):$(id -g)" app bash
```

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
## Part 3: Create Recipe and Testing (TDD)
```
docker-compose exec app bash
# docker-compose exec --user "$(id -u):$(id -g)" app rails db:reset
```
```
rails g migration create_recipes
```
Edit recipe migration and recipe model.
Now insert minitest and factory girl into Gemfile.
Now install the gems after container restart.
```
rails g minitest:install
```
Need to generate the factory for the create method in recipe testing.
```
rails g factory_girl:model User
rails g factory_girl:model Recipe
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

# Useful commands to control the app
Entering the database to modify users
https://gist.github.com/apolloclark/ea5466d5929e63043dcf
```
docker exec -ti mealplan_prod_db_1 /bin/bash
psql -U postgres
CREATE USER <user> WITH PASSWORD '<password>';
ALTER USER meal_planner WITH SUPERUSER;
```
# Postgres Cheat Sheet
list users
```
SELECT rolname FROM pg_roles;
```
list database
```
\l
```

# Testing production locally
```
$ docker-compose -f docker-compose.prod.yml build prod_app
... After the image is built
$ docker-compose -f docker-compose.prod.yml run --rm prod_app rake db:create
$ docker-compose -f docker-compose.prod.yml run --rm prod_app rake db:migrate
```

# Running the app with the nginx overrides for local development
```
docker-compose -f docker-compose.yml -f docker-compose.override.yml build
docker-compose -f docker-compose.yml -f docker-compose.override.yml rake db:create
docker-compose -f docker-compose.yml -f docker-compose.override.yml rake db:migrate
docker-compose -f docker-compose.yml -f docker-compose.override.yml up
```