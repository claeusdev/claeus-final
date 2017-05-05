class AddSubcategoryToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :subcategory, foreign_key: true
  end
end
