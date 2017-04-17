class AddImageToAssets < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :image, :string
  end
end
