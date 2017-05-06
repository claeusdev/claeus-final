class Category < ApplicationRecord

  has_many :products, through: :subcategories
  has_many :subcategories
  has_many :stores

end
