class Category < ApplicationRecord

    mount_uploader :avatar, ImageUploader

    validates :name, presence: true,
                uniqueness: true
    has_many :products

    has_ancestry
end
