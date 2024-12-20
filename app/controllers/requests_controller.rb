class RequestsController < ApplicationController

  def index
    @request = Request.find_by(product_id: params[:product_id])

    @product = Product.find(@request.product_id)
    @user = User.find( @request.user_id)
  end
  def new
    @product = Product.find(params[:product_id])
   
    @request = Request.new
  end

  def create
    @request = Request.new(params_validate)
    @request.user_id = current_user_id
    @request.product_id = params[:product_id]
    @request.status = "pending"
    if @request.save
      redirect_to products_path, notice: "Request sent successfully"
    else
      render :new, notice: "Request failed"
    end
  end

  def update
  puts "-------------", params[:commit]
  @request = Request.find(params[:id])
   if params[:commit]=="Accepted"
    @request.update(status: "accepted")
    redirect_to my_product_products_path, notice: "Accepted Successfully"
   elsif params[:commit]=="Rejected"
      @request.update(status: "rejected")
    redirect_to product_requests_path(@product.id), notice: "Rejected"
   else
      redirect_to product_requests_path(@product.id), notice: "Invalid Action"
   end
  end

  private

  def params_validate
    params.require(:request).permit(:request_amount)
  end
end
