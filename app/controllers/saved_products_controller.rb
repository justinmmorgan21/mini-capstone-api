class SavedProductsController < ApplicationController
  def create
    if current_user
      @saved_product = SavedProduct.new(
        user_id: current_user.id,
        product_id: params[:product_id]
      )
      if @saved_product.save
        render :show
      else
        render json: {error: @saved_product.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: { message: "You must be logged in." }
    end
  end

  def index
    if current_user
      @saved_products = SavedProduct.where(user_id: current_user.id)
      render :index
    else
      render json: { message: "You must be logged in." }
    end
  end

end