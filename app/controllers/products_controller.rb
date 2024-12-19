class ProductsController < ApplicationController
  def index
    @products = Product.where.not(user_id: session[:user_id])
  end

  def new
    @product = Product.new
  end

  def create
   @product = Product.new(params_validate)
   @product.user_id = session[:user_id]
   if @product.save
    redirect_to my_product_products_path, notice: "Product was successfully created."
   else
    redirect_to new_product_path, notice: "Product not created"

   end
  end

  
  def my_product
    @products = Product.where(user_id: session[:user_id])
  end

  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(params_validate)
    redirect_to my_product_products_path, notice: "Product was successfully updated."
    else
      redirect_to new_products_path, notice: "Product was not updated."
    end
    
  end

def destroy
  puts "--------",params[:id]
  @product = Product.find(params[:id])
    
    @product.destroy
    redirect_to my_product_products_path, notice: "Product was successfully deleted."

end

  


  private

  def params_validate
    params.require(:product).permit(:name, :description, :amount)

  end



end
