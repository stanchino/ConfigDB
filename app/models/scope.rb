class Scope < ActiveRecord::Base
  belongs_to :organization
  has_many :values
  has_many :variables, through: :values
end
