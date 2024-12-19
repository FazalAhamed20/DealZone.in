class BargainsController < ApplicationController
  def edit
    @product = Product.find(params[:id])
  end

  def update
  end
end
