class ProductsController < ApplicationController
  
  # CREATE
  def create
    @product = Product.new(product_params)
    if @product.save
      params[:images] && params[:images].each { |image|
        Image.create(url: image, product_id: @product.id)
      }
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
  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.inventory = params[:inventory] || @product.inventory
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    if @product.save
      params[:images] && params[:images].each { |image|
        Image.create(url: image, product_id: @product.id)
      }
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
  
  def product_params
    {
      name: params[:name], 
      price: params[:price],  
      description: params[:description],
      inventory: params[:inventory],
      supplier_id: params[:supplier_id]
    }
  end

  def images_show
    @product = Product.find_by(id: params[:id])
    render :show
  end
end
