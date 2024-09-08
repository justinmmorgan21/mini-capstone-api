class ProductsController < ApplicationController
  
  def product_params
    {
      name: params[:name], 
      price: params[:price], 
      image_url: params[:image_url], 
      description: params[:description]
    }
  end

  # CREATE
  def create
    @product = Product.new(product_params)
    if @product.save
      render :show
    else
      render json: {error: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # READ
  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def index
    @products = Product.all
    render :index
  end

  # UPDATE
  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    if @product.save
      render :show
    else
      render json: {error: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # DESTROY
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "#{@product.name} deleted."}
  end
  
end
