class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :store, foreign_key: true
      t.integer :stock

      t.timestamps
    end
  end
end
