class RemoveOrganizationFromUser < ActiveRecord::Migration
  def change
    remove_reference :users, :organization, index: true
  end
end
