class ProductsController < ApplicationController
   before_action :authenticate_user!
  def index
    @products = Product.where.not(user_id: current_user_id)
    @requests = Request.all
  end

  def new
    @product = Product.new
  end

  def create
   @product = Product.new(params_validate)
   if Product.exists?(name: @product.name)
    redirect_to new_product_path, alert: "Product already exists"
   else
    @product.user_id = current_user_id
    if @product.save
     redirect_to my_product_products_path, notice: "Product was successfully created."
    else
     redirect_to new_product_path, alert: "Product not created"
 
    end
   end

 
  end

  
  def my_product
    @products = Product.where(user_id: current_user_id)
    @requests = Request.all
  end

  def edit
    @product = Product.find_by(id: params[:id], user_id: current_user_id)
    if @product 
      render :edit
    else
      redirect_to my_product_products_path,alert: "No such product to edit"

    end

  end
  def update
    @product = Product.find(params[:id])
    if @product.update(params_validate)
    redirect_to my_product_products_path, notice: "Product was successfully updated."
    else
      redirect_to new_products_path, alert: "Product was not updated."
    end
  end

def destroy
  @product = Product.find(params[:id])
  @product.requests.destroy_all

  if @product.destroy
    redirect_to my_product_products_path, notice: "Product was successfully deleted."
  else
    redirect_to my_product_products_path, alert: "Product was not deleted."

  end
    
end

  


  private

  def params_validate
    
    params.require(:product).permit(:name, :description, :amount)

  end



end