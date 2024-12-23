class RequestsController < ApplicationController
  before_action :logged_in 
  def index

    @request = Request.includes(:user, :product).find_by(id: params[:product_id])
    # @request = Request.find_by(product_id: params[:product_id])

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
      render :new, notice: "Request failed"
    end
  end

  def update
    puts 'rrrrrrrrr',params
  @request = Request.find(params[:id])
   if params[:commit]=="Accepted"
    @request.update(status: "accepted")
    puts 'ppppppppppppp',@request.status
    redirect_to my_product_products_path, notice: "Accepted Successfully"
   elsif params[:commit]=="Rejected"
    # @request.destroy
      @request.update(status: "rejected")
    redirect_to my_product_products_path, notice: "Rejected Successfully"
   else
      redirect_to product_requests_path(params[:product_id]), notice: "Invalid Action"
   end
  end

  def requested_products
    @requests = Request.includes(:product).where(user_id: current_user_id)
  puts '............',@requests
  end
  private

  def params_validate
    params.require(:request).permit(:request_amount)
  end
end