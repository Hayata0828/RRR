100.times do |i|
  Product.seed_once(:id) do |product|
    product.id = i + 1
    product.title = "#{ i + 1 }の商品"
    product.description = "#{ i + 1 }番目の商品の説明文"
    product.price = ( i + 1) * 100
  end
end