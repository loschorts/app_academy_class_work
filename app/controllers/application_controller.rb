class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  helper_method :current_user # lets views access these methods

  def current_user
    # fail
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
    # find_by_session_token is a dynamic method created by Rails
  end

  def login_user!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end
end
