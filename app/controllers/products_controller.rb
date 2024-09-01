class ProductsController < ApplicationController
  def show
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def index
    @products = Product.all
    render template: "products/index"
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render template: "products/show"
    else
      render json: {message: "ERROR"}
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.save
    render template: "products/show"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render template: "products/show"
  end
  
  def product_params
    {
      name: params[:name], 
      price: params[:price], 
      image_url: params[:image_url], 
      description: params[:description]
    }
  end
end
