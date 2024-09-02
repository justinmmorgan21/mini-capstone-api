require 'net/http'
require 'http'
# CREATE - no attempt



# DELETE - successful
# 
# url = "http://localhost:3000/products/6.json"
# response = HTTP.delete(url)
# hash = JSON.parse(response.to_s)
# hash.each { |product|
#   puts product
# }



# READ - succesful
# 
# url = "http://localhost:3000/products/2.json"
# response = HTTP.get(url)
# product = JSON.parse(response.to_s)
# puts product

# url = "http://localhost:3000/products.json"
# response = HTTP.get(url)
# products = JSON.parse(response.to_s)
# while (true)
#   puts "Products: "
#   products.each { |product|
#     puts "\t#{product["name"]}"
#   }
#   puts
#   print "Enter an item for show: "
#   product_name = gets.chomp
#   products.each { |product|
#     if product["name"] == product_name
#       puts product
#       puts
#     end
#   }
# end



# UPDATE - unsuccessful
# 
# url = "http://localhost:3000/products.json"
# response = HTTP.get(url)
# hash = JSON.parse(response.to_s)
# hash.each { |product|
#   puts product
# }

# uri = URI("http://localhost:3000/products/2")
# http = Net::HTTP.new(uri.host, uri.port)
# http.use_ssl = (uri.scheme == 'https')
# request = Net::HTTP::Patch.new(uri.request_uri)
# request['Content-Type'] = 'application/json'
# request.body = { price: 14}.to_json
# response = http.request(request)
# puts response.class
# hash = JSON.parse(response.to_s)
# hash.each { |product|
#   puts product
# }