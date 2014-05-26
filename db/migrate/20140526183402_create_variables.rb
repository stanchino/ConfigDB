class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.string :name
      t.string :textkey
      t.references :category, index: true

      t.timestamps
    end
  end
end
