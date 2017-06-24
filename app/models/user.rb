class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  mount_uploader :avatar, ImageUploader

  has_one :store, dependent: :destroy
  has_many :reviews
  has_many :notifications, foreign_key: :reciepient_id
  
  # accepts_nested_attributes_for :store

  def following? store, user
    store.follower_ids.include? user.id
  end

  def follow (store, user)
    store.followers << user
  end

  def unfollow (store, user)
    store.followers.delete(user.id)
  end

  

  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name # assuming the user model has a name
      user.remote_avatar_url = auth.info.image

      # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      #  user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


end
