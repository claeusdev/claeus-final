class AddDetailsToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :city, :string
    add_column :stores, :phone, :string
    add_column :stores, :website, :string
  end
end
