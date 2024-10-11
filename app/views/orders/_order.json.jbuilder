json.id order.id
json.user_id order.user_id
# json.product_id order.product_id
# json.quantity order.quantity
json.subtotal order.subtotal
json.tax order.tax
json.total order.total
json.carted_products order.carted_products do |cp|
  json.id cp.id
  json.product cp.product
  json.quantity cp.quantity
end
json.created_at order.created_at
json.updated_at order.updated_at
# json.product order.product