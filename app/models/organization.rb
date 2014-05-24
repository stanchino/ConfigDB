class Organization < ActiveRecord::Base
  resourcify

  has_many :users
  has_many :environments
  has_many :scopes
  has_many :categories
end
