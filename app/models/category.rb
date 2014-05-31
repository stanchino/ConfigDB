class Category < ActiveRecord::Base
  resourcify

  belongs_to :organization
end
