class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity]
    subtotal = product.price.to_f * quantity.to_f
    tax = product.tax.to_f * quantity.to_f
    total = subtotal + tax
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @order.save
    render :show
  end

  def show
    if current_user
      @order = Order.find_by(id: params[:id])
      render :show
    else
      render json: { message: "You must be logged in." }
    end
  end

  def index
    if current_user
      @orders = Order.all
      render :index
    else
      render json: { message: "You must be logged in." }
    end
  end
end
