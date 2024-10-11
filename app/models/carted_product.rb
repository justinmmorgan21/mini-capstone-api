class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :product

  # def total
  #   const subtotal = CartedProduct.where(id: current_user.id).sum { |cp|
  #     cp.product.price * cp.quantity
  #   }
  #   (subtotal * 1.09).toFixed(2);
  # end
end
