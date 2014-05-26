class AddNameToScope < ActiveRecord::Migration
  def change
    add_column :scopes, :name, :string
  end
end
