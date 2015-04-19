json.(shop, :id, :name)

json.event do
  json.partial! 'events/event', event: shop.event
end

if shop.crewed_by?(current_user) or current_user.admin?
end
