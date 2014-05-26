class Value < ActiveRecord::Base
  belongs_to :variable
  belongs_to :environment
  belongs_to :scope
end
