class AddTextkeyToScope < ActiveRecord::Migration
  def change
    add_column :scopes, :textkey, :string
  end
end
