class Scope < ActiveRecord::Base
  resourcify

  belongs_to :organization
  has_many :values
  has_many :variables, through: :values
end
