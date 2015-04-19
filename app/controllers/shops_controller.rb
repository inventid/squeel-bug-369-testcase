class ShopsController < ApplicationController

  def index
    @shops = Shop.crewed_by(current_user)

    if params[:user_id].present?
      current_user_id = current_user.id
      user = User.where { users.id == current_user_id}.find(params[:user_id])
      @shops = @shops.crewed_by(user)
    end


    p 'For your convenience I echo the SQL query Squeel formulates'
    p 'If you remove the escaping backslashes and format the query, one notices that "accessible_type = WHERE" occurs, yielding invalid SQL'
    p @shops.to_sql
  end

end
