class Organization < ActiveRecord::Base
  resourcify

  has_many :users
  has_many :environments
end
