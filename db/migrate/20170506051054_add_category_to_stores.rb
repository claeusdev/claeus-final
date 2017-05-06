class AddCategoryToStores < ActiveRecord::Migration[5.0]
  def change
    add_reference :stores, :category, foreign_key: true
  end
end
