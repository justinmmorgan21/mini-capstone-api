class CartedProductsController < ApplicationController
  def index
    if current_user
      @carted_products = CartedProduct.where(user_id: current_user.id,status: "carted")
      render :index
    else
      render json: { message: "You must be logged in." }
    end
  end

  def create
    if current_user
      @carted_product = CartedProduct.new(
        product_id: params[:product_id],
        user_id: current_user.id,
        quantity: params[:quantity],
        order_id: nil,
        status: "carted",
      )
      if @carted_product.save
        render :show
      else
        render json: {error: @carted_product.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: { message: "You must be logged in." }
    end
  end
  
  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(status: "removed")
    @carted_products = CartedProduct.where(user_id: current_user.id,status: "carted")
    render :index

  end
end
