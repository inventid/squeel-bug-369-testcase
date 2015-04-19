json.(organization, :id, :name)

if organization.crewed_by?(current_user) or current_user.admin?
end