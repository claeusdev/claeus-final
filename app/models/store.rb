class Store < ApplicationRecord
  RESTRICTED_NAMES = %w[www]

  belongs_to :user
  has_many :products, dependent: :destroy

  validates :name, presence: true,
                  uniqueness: { case_sensitive: false},
                  format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters'},
                  exclusion: { in: RESTRICTED_NAMES, message: 'restricted'}

  validates :description, :tagline, presence: true
end
