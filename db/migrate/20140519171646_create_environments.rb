class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.references :organization, index: true
      t.string :name
      t.string :textkey

      t.timestamps
    end
  end
end
