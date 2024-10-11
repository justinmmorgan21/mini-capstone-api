class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def update_carted_products(carted_products)
    carted_products.each { |carted_product|
      carted_product.update(order_id: id, status: "purchased")
    }
  end

end
