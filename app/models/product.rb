class Product < ApplicationRecord
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

  

end
