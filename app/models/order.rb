class Order < ApplicationRecord
  belongs_to :user
  belongs_to :carted_product, optional: true
  has_many :products, through: :carted_products

  def self.subtotal(carted_products)
    carted_products.sum { |carted_product|
      carted_product.product.price * carted_product.quantity
    }
  end

  def update_carted_products(carted_products)
    carted_products.each { |carted_product|
      carted_product.update(order_id: id, status: "purchased")
    }
  end

end
