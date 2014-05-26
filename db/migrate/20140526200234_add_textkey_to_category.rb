class AddTextkeyToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :textkey, :string
  end
end
