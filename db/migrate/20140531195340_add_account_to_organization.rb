class AddAccountToOrganization < ActiveRecord::Migration
  def change
    add_reference :organizations, :account, index: true
  end
end
