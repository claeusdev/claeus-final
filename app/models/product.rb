class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :store
  has_many :assets
  accepts_nested_attributes_for :assets, :reject_if => lambda { |t| t['asset'].nil? }

  validates :name, :price, :description, :image, :stock, presence: true

end
