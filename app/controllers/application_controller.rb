class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  if @review.blank?
    @avg_rating = 0
  else
    @avg_rating = @product.reviews.average(:rating).round(2)
  end


 protected
   def after_sign_in_path_for(resource)
     user_path(current_user) #your path
   end

   def after_sign_up_path_for(resource)
     user_path(current_user) #your path
   end
end
