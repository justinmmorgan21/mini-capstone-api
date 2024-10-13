json.carted_products do
  json.array! @carted_products, partial: "carted_products/carted_product", as: :carted_product
end
json.total @carted_products.sum(&:total)