class Environment < ActiveRecord::Base
  resourcify

  belongs_to :organization

  validates_presence_of :organization, on: :create
  validates_uniqueness_of :textkey, scope: :organization_id
end
