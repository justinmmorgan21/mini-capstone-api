class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length:  { in: 2..500 }

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

  belongs_to :supplier

  has_many :images

  has_many :orders
end
