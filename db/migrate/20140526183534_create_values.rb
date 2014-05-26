class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.references :variable, index: true
      t.references :environment, index: true
      t.references :scope, index: true
      t.string :value

      t.timestamps
    end
  end
end
