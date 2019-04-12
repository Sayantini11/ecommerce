class ProductsController < ApplicationController

  #path - product_path
  #url - http://localhost:3000/products
  #uri - /products
  #http methods - GET
  #roles & responsibility - to list all products

  def index
	@products = Product.all
  end

  # path - new_product_path
  #path - new_product_path
  #url - http://localhost:3000/products/new
  #uri - /products/new
  #http methods - GET
  #roles & responsibility - is to setup a form for adding new product

  def new
	@product = Product.new
  end

  #path - products_path
  #url - http://localhost:3000/products/new
  #uri - /products
  #http methods - POST
  #roles & responsibility - take the data coming in from the form, pass it to the constructor as an argument,validate the object, if the validations pass insert the record to the db and redirect the user to a new page, else display the errors on the form
 
  def create
	   @product = Product.new(params[:product].permit(:name, :description, :price, :stock, :category_id, :cod_eligible, :image_url))
	   if @product.save
		    redirect_to product_path(@product.id), notice: "Product was successfully created"
	   else
		    render action: 'new'  
	   end
  end


  # path - product_path(id)
  #url - http://localhost:3000/products/:id
  #uri - /products/:id 
  #http methods - GET
  #roles & responsibility - to find the product from the databse and display it on the show page, this page will be used to show all the data about a product and also associated information like all reviews, all 1&a's, add product to cart

   def show
     @product = Product.find(params[:id])
   end

  # path - edit_product_path(id)
  #url - http://localhost:3000/products/:id/edit
  #uri - /products/:id/edit
  #http methods - GET
  #roles & responsibility - to find the record the user is trying to edit and display it on a form


   def edit
   	  @product = Product.find(params[:id])
   end

  # path - product_path(id)
  #url - http://localhost:3000/products/:id
  #uri - /products/:id 
  #http methods - PATCH
  #roles & responsibility - find the record the user just updated in the browser, update its information by taking th e data coming in from the form, validate the object, if the validations pass update the record to the db and redirect the user to a new page, else display the errors on the form

   def update
   	  @product = Product.find(params[:id])
   	  if @product.update_attributes(params[:product].permit(:name,:description, :price, :stock, :category_id, :cod_eligible, :image_url))
         redirect_to product_path(@product.id), notice: "The product was successfully updated"
      else
         render action: "edit"
      end
   end	


  # path - product_path(id)
  #url - http://localhost:3000/products/:id
  #uri - /products/:id
  #http methods - DELETE
  #roles & responsibility - to find the record the user is trying to delete and destroy the record and redirect the user to a index page

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "The product was successfully deleted"
  end


end
