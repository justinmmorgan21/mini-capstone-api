json.id carted_product.id
json.product_id carted_product.product_id
json.user_id carted_product.user_id
json.quantity carted_product.quantity
json.order_id carted_product.order_id
json.status carted_product.status
json.product do
  json.partial! 'products/product', product: carted_product.product
end