class OrdersController < ApplicationController
  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = carted_products.sum { |carted_product|
      carted_product.product.price * carted_product.quantity
    }
    tax = subtotal * 0.09
    total = subtotal + tax
    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @order.save
    @order.update_carted_products(carted_products)
    render :show
  end

  def show
    if current_user
      @order = Order.find_by(id: params[:id])
      if @order.user_id == current_user.id
        render :show
      else
        render json: { message: "That is not your order" }
      end
    else
      render json: { message: "You must be logged in." }
    end
  end

  def index
    if current_user
      @orders = Order.where(user_id: current_user.id)
      render :index
    else
      render json: { message: "You must be logged in." }
    end
  end
end
