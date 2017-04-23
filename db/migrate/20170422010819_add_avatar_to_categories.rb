class AddAvatarToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :avatar, :string
  end
end
