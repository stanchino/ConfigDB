Contributing
============
The ConfigDB project is OpenSource. Everyone that wants to get involved
is welcome and can feel free to reuse all the compoments available here.

Useful tools
============

### Mac users

* [Hombrew](http://mxcl.github.com/homebrew/)
* [RVM](https://rvm.io/)
* [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [iTerm](http://www.iterm2.com/#/section/home)
* [Postgres](http://www.enterprisedb.com/products-services-training/pgdownload#osx)

NOTE: Before you get started make sure you have the **latest [Xcode](https://developer.apple.com/xcode/) with command line tool installed**


Project Set Up
==============

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
