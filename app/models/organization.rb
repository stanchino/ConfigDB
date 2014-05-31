class Organization < ActiveRecord::Base
  resourcify

  belongs_to :account
  has_many :users, through: :account
  has_many :environments
  has_many :scopes
  has_many :categories
end
