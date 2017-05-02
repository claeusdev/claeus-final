class Store < ApplicationRecord
  RESTRICTED_NAMES = %w[www]
  
  mount_uploader :logo, ImageUploader

  belongs_to :user
  belongs_to :category
  has_many :products, dependent: :destroy

  validates :name, presence: true,
                  uniqueness: { case_sensitive: false},
                  format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters'},
                  exclusion: { in: RESTRICTED_NAMES, message: 'restricted'}

  validates :description, :tagline, :category, presence: true
  validates :slug, uniqueness: true, presence: true

  before_validation :generate_slug



  def to_param
    "#{id}-#{name}".parameterize
  end


  def generate_slug
    self.slug ||= name.parameterize
  end

  is_impressionable
end
