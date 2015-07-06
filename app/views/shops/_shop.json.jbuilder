json.(shop, :id, :name)

json.event do
  json.partial! 'events/event', event: shop.event
end
