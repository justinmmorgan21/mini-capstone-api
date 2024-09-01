class ProductsController < ApplicationController

  def get_product
    render json: {message: "hey"}
  end

end
