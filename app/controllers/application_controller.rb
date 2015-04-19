class ApplicationController < ActionController::Base
  include ApplicationHelper
  # require 'lib/exceptions.rb'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  rescue_from Exceptions::AuthorizationRequiredError, with: :rescue_from_authorization_required_error

  def rescue_from_not_authorized_error(error)
    head :forbidden
  end

  def rescue_from_authorization_required_error(error)
    head :unauthorized, 'X-Authenticate' => error.authorization_method
  end

  def validate_session
    unless session.present?
      return head :forbidden
    end
  end

  def validate_current_user
    unless current_user.present?
      return head :forbidden
    end
  end

end
