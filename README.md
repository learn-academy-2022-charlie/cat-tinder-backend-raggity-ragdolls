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

 2938  rails new cat-tinder-backend -d postgresql -T
 2939  cd cat-tinder-backend
 2940  rails db:create
 2941  bundle add rspec-rails
 2942  rails g rspec:install
 2943  rails s
 2944  git remote add origin https://github.com/learn-academy-2022-charlie/cat-tinder-backend-raggity-ragdolls.git
 2945  git checkout -b main
 2946  git status
 2947  git add .
 2948  git commit -m "initial commit"
 2949  git push origin main
 2950  git checkout -b backend-structure
 rails g resource Monster name:string age:integer specialty:text quote:text
 rails db:migrate