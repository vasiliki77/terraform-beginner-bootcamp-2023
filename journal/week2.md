# Terraform Beginner Bootcamp 2023 - Week2


## Working with Ruby

### Bundler

Bundler is a package manager for ruby. 
It is the primary way to install ruby packages (known as gems) for ruby.

#### Install Gems

You need to create a Gemfile and define your gems in that file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```
Then you need to run the `bundle install` command. 
This will install the gems on the system globally (unlike nodejs with installs packages in place in a folder called node_modules)

A Gemfile.lock will be created to lock down the gem versions used in this project.

#### Executing ruby scripts in the contect of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed. This is the way we set context. 

#### Sinatra

[Sinatra](https://sinatrarb.com/) is a micro web-framowork for ruby to build web-apps. 
It's great for mock or development servers or for very simple projects.

We can create a web-server in a single file.


## Terratowns Mock Server

### Running the web server

We can run the web server by executing the following commands:
```rb
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.
