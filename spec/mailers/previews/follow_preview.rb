# Preview all emails at http://localhost:3000/rails/mailers/follow
class FollowPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/follow/follow_message
  def follow_message
    FollowMailer.follow_message
  end

  # Preview this email at http://localhost:3000/rails/mailers/follow/unfollow_message
  def unfollow_message
    FollowMailer.unfollow_message
  end

end
