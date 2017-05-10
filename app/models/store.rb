class Store < ApplicationRecord
  is_impressionable
  RESTRICTED_NAMES = %w[www]

  mount_uploader :logo, ImageUploader

  belongs_to :user
  belongs_to :category

  has_many :passive_relationships, class_name: "Relationship",
                                    foreign_key: "followed_id",
                                    dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower

  
  has_many :products, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :name, presence: true,
                  uniqueness: { case_sensitive: false},
                  format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters'},
                  exclusion: { in: RESTRICTED_NAMES, message: 'restricted'}

  validates :description, :category, :tagline, presence: true
  validates :slug, uniqueness: true, presence: true

  before_validation :generate_slug



#

# Get all stores tagged with name

def self.tagged_with(name)
  Tag.find_by!(name: name).stores
end

# tags and taggings setting tags
  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

# Getting tags
  def all_tags
    tags.map(&:name).join(", ")
  end

# COnverts id and name to string for pretty urls
  def to_param
    "#{id}-#{name}".parameterize
  end

# Generates slug for future use
  def generate_slug
    self.slug ||= name.parameterize
  end


end
