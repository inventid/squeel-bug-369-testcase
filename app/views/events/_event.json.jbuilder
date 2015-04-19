json.(event, :id, :name)

json.organization do
  json.partial! 'organizations/organization', organization: event.organization
end
