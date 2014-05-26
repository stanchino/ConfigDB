class Variable < ActiveRecord::Base
  belongs_to :category
  has_many :values
  has_many :scopes, through: :values
  has_many :environments, through: :values
end
