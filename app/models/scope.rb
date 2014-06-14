class Scope < ActiveRecord::Base
  resourcify

  belongs_to :organization
  has_many :values
  has_many :variables, through: :values

  validates_presence_of :name
  validates_presence_of :textkey
  validates_uniqueness_of :name, scope: :organization_id
  validates_uniqueness_of :textkey, scope: :organization_id
end
