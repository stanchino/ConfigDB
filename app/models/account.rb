class Account < ActiveRecord::Base
  has_many :users
  has_many :organizations

  accepts_nested_attributes_for :organizations
end
