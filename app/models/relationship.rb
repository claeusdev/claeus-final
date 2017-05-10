class Relationship < ApplicationRecord

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "Store"

  validates :follower_id, :follower_id, presence: true
end
