class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :organization, index: true

      t.timestamps
    end
  end
end
