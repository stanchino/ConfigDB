Contributing
============
The ConfigDB project is OpenSource. Everyone that wants to get involved
is welcome and can feel free to reuse all the compoments available here.

[![Code Climate](https://codeclimate.com/github/stanchino/ConfigDB.png)](https://codeclimate.com/github/stanchino/ConfigDB)

## Useful tools

### Mac users

* [Hombrew](http://mxcl.github.com/homebrew/)
* [RVM](https://rvm.io/)
* [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [iTerm](http://www.iterm2.com/#/section/home)
* [Postgres](http://www.enterprisedb.com/products-services-training/pgdownload#osx)

NOTE: Before you get started make sure you have the **latest [Xcode](https://developer.apple.com/xcode/) with command line tool installed**


## Project Set Up

ConfigDB is a [Ruby on Rails](http://rubyonrails.org/) application that uses the latest [Ruby](https://www.ruby-lang.org/en/) version.

The project includes a [.ruby-version](.ruby-version) and [.ruby-gemset](.ruby-gemset) files that will automatically load the current version for you if you are using [RVM](https://rvm.io/).

1. To clone the code from the lastest GitHub commit run:
  
   ```
   git clone git@github.com:stanchino/ConfigDb.git ConfigDB
   ```
2. Install all the gems the project uses (this might take a few minutes):

   ```
   bundle install
   ```
3. Create your own database configuration file:

   ```
   cp config/database.sample.yml config/database.yml
   ```
4. After the database configuration is set create the development and test databases:

   ```
   rake db:create db:migrate db:test:load db:test:prepare
   ```
5. In order to populate the database with sample data run:

   ```
   rake db:seed
   ```

## Running the App

The default application server that is configured is [Puma](http://puma.io/). There is also a [Procfile](https://devcenter.heroku.com/articles/procfile) you can use to deploy to [Heroku](https://www.heroku.com/).
```
bundle exec puma -C config/puma.rb
```

Libraries
=========
This section provides information on internal and third party libraries. Each section should provide a reasoning to why the library was created or choosen and what it provides for the codebase.

Third Party
------------
### Slim
The [slim](http://slim-lang.com/) library is an indentation based templating engine very similar in style and purpose to `haml` although it's more terse. It makes `html` easier to write and read.

### Simple Form
[Simple Form](https://github.com/plataformatec/simple_form) is one abstraction on top of normal rails forms that add some intelligent defaults and customization options that Rails lack. It's also Twitter Bootstrap friendly.

### Capybara
For our integration tests we use [Capybara](https://github.com/jnicklas/capybara). We considered that Capybara is the thinest layer we can have to reproduce very top level user like interactions. In contrast the alternative tool, Cucumber, adds too much effort and unneeded cost of maintanance when writing features that can be written in a very similar way in plain ruby with Capybara.

### Backbone.js
[Backbone](http://backbonejs.org/) adds a minimal but useful structure to javascript that lets developers separate view from model related code. It also provides automatic ajax call generation by leveraging the REST actions rails provides and a very clean event model.

### Foreman
The application is currently deployed on [Heroku](http://www.heroku.com) which internally runs `foreman` to read the root's `Procfile` to setup the server and any possible satellite machine we may need (for example workers for background processing). So to keep the local server behavior as closer as we can to the way `heroku` works, it's recommended to run the server through `foreman start` instead of `rails server`. Foreman also has the ability to load `.env` files from your local setup which let's you set global `ENV` variables without needing to polute your local machine with them.

### JST and EJS
[JST](https://github.com/sstephenson/sprockets#javascript-templating-with-ejs-and-eco) is the rails assets pipeline way of dealing with javascripts view templates. It's easier to test and integrate with `Konacha` as it doesn't require a dom element to store the templates.
