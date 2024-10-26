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
    @saved_products = SavedProduct.all
    render :index
  end
end