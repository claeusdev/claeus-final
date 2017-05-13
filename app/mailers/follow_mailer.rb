class FollowMailer < ApplicationMailer
    default from: "claeuschief@claeus.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.follow_mailer.follow_message.subject
  #
  def follow_message(user)
    @user = user

    mail to: @user.email, subject: "New follower Alert!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.follow_mailer.unfollow_message.subject
  #
  def unfollow_message(user)
    @user = user

    mail to: @user.email, subject: "Someone has unfollowed you!"
  end
end
