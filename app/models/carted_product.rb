class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :product

  def total
    quantity * product.price * 1.09
  end

end
