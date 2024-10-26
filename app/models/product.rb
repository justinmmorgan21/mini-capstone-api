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

  def get_images
    if images.length == 0
      [id: -1, url:'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=']
    else
      images
    end
  end

  belongs_to :supplier

  has_many :images

  has_many :category_products
  has_many :categories, through: :category_products
end
