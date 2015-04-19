module ApplicationHelper

  # General
  def current_user
    if @current_user.present?
      @current_user
    elsif current_session.present? and current_session.user.present?
      @current_user = current_session.user
    end
  end

  def current_session
    if @current_session.present?
      @current_session
    elsif request.headers['X-Session-Token'].present?
      @current_session = Session.find_by token: request.headers['X-Session-Token']
    elsif Rails.env.test? and request.headers.env['X-Session-Token'].present?
      @current_session = Session.find_by token: request.headers.env['X-Session-Token']
    end
  end

end
