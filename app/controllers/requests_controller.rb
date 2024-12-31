class RequestsController < ApplicationController
  before_action :authenticate_user!
  def index
   # @products = Product.includes(:user, :requests).where(id: params[:product_id])
   # @requests = Request.includes(product: :user).where(product_id:params[:product_id],requests:{status:"pending"},product:{user_id:current_user_id})
   @request = Request.find_by(product_id: params[:product_id], requests: { status: "pending" })
    # @product = Product.find(@request.product_id)
    # @user = User.find( @request.user_id)
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
      render :new, alert: "Request failed"
    end
  end

  def update
  @request = Request.find(params[:id])
   if params[:commit]=="Accepted"
    @request.update(status: "accepted")
    redirect_to my_product_products_path, notice: "Accepted Successfully"
   elsif params[:commit]=="Rejected"
      @request.update(status: "rejected")
    redirect_to my_product_products_path, notice: "Rejected Successfully"
   else
      redirect_to product_requests_path(params[:product_id]), alert: "Invalid Action"
   end
  end

  def requested_products
    @requests = Request.includes(:product).where(user_id: current_user_id)
  end
  private

  def params_validate
    params.require(:request).permit(:request_amount)
  end
end
