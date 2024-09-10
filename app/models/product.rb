class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length:  { in: 10..500 }

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def tax_formatted_string
    "$%0.2f" % [tax]  
  end

  def total
    price + tax
  end

  def total_formatted_string
    "$%0.2f" % [total]
  end

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  belongs_to :supplier

  has_many :images
end
