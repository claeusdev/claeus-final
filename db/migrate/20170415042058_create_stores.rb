class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :tagline
      t.references :user, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
