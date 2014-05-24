class CreateScopes < ActiveRecord::Migration
  def change
    create_table :scopes do |t|
      t.references :organization, index: true

      t.timestamps
    end
  end
end
