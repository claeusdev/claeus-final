class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :store
  has_many :assets
  belongs_to :category
  accepts_nested_attributes_for :assets, :reject_if => lambda { |t| t['asset'].nil? }

  validates :name, :price, :description, :image, :stock, presence: true
  validates :slug, uniqueness: true, presence: true

  before_validation :generate_slug



  def to_param
    "#{id}-#{name}".parameterize
  end

  def self.search(params)
    @products = Product.where("name LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    @products
  end

  def generate_slug
    self.slug ||= name.parameterize
  end
end
