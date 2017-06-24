class Search
	attr_reader :term

	def to_partial_path
		'searches/show'
	end

	def initialize(options = {})
		@term = options.fetch(:term, "")
	end

	def found_products
		products
	end

	def found_stores
		stores
	end

	private

	def stores
		@store = Store.where("name iLike ? or description iLike ?", search_term, search_term)
	end

	def products
    @products = Product.where("name iLIKE ? or description iLIKE ?", search_term, search_term)
	end

	def search_term
		"%#{term}%"
	end
	
end