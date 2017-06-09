module StoreHelper
	def follow_button store

		if  current_user != store.user 
			if current_user.following?(store, current_user)
				button_to 'Unfollow', store_unfollow_path(store), method: :delete, class: "btn btn-danger button"
			else
				button_to 'Follow', store_follow_path(store), class: "btn btn-danger button"
			end
		end
		
	end
end

