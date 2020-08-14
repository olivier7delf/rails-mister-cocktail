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
>heroku create $YOUR_APP_NAME --region eu

!!!! USE root in your routes and views ! or you don't find your app at
https://cocktails-435-1.herokuapp.com/


maj db:
git push heroku master

heroku run rails db:migrate
heroku run rails db:seed
