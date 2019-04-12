class CategoriesController < ApplicationController 
	def index
		@categories = Category.all
	end

	def new
	  @category = Category.new
  end

  def create
	  @category = Category.new(params[:category].permit(:name))
	  if @category.save
		    redirect_to categories_path, notice: "category was successfully created"
	  else
		    render action: 'new'  
	  end
  end

  def show
        @category = Category.find(params[:id])
  end

  def edit
   	    @category = Category.find(params[:id])
  end

  def update
   	  @category = Category.find(params[:id])
   	  if @category.update_attributes(params[:category].permit(:name))
         redirect_to category_path(@category.id), notice: "The category was successfully updated"
      else
         render action: "edit"
      end
  end	

  def destroy
       @category = Category.find(params[:id])
       @category.destroy
       redirect_to categories_path, notice: "The category was successfully deleted"
  end

end
