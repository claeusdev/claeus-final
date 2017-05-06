class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :stores, through: :taggings
end
