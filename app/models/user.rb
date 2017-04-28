class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable

  mount_uploader :avatar, ImageUploader

  has_one :store, dependent: :destroy
  has_many :reviews



  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end

  def about_me
    return "#{about}"  if (about)
    "Hi, i'm very sorry but i am yet to write something useful about myself here."
  end

end
