json.(session, :token)

json.user do
  json.partial! 'users/user', user: session.user
end
