json.(user, :id, :name)

if current_user.present? and (user == current_user or current_user.admin?)
  json.(user, :email_address)
end