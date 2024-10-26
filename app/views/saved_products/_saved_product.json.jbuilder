json.id saved_product.id
json.user_id saved_product.user_id
json.product_id saved_product.product_id
json.product do
  json.partial! 'products/product', product: saved_product.product
end