class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader


  belongs_to :store
  has_many :reviews
  belongs_to :category
  belongs_to :subcategory
  validates :name, :price, :description, :category, :images, :stock, presence: true
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
