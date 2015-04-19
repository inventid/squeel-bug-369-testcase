json.array! @shops do |shop|
  json.partial! 'shops/shop', shop: shop
end