class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable

  mount_uploader :avatar, ImageUploader

  has_one :store, dependent: :destroy
  has_many :reviews

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed

  def follow(store)
    active_relationships.create(followed_id: store.id)
  end


  def unfollow(store)
    active_relationships.find_by(followed_id: store.id).destroy
  end

  def following?(store)
    following_ids.include?(store.id)
  end


  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end

  def about_me
    return "#{about}"  if (about)
    "Hi, i'm very sorry but i am yet to write something useful about myself here."
  end


end
