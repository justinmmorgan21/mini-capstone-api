class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render :index
  end

  def show
    @supplier = Supplier.find_by(id: "#{params[:id]}")
    render :show
  end

  def create
    
  end

  def supplier_params
    
  end
end
