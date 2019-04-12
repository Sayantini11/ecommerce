class CategoriesController < ApplicationController 
	
#path - categories_path
#url - http://localhost:3000/categories
#uri - /categories
#http methods - GET
#roles & responsibility - to list all categories

	def index
		@categories = Category.all
	end


#path - new_category_path
#url - http://localhost:3000/categories/new
#uri - /categories/new
#http methods - GET
#roles & responsibility - is to setup a form for adding a new category

	def new



	end

end