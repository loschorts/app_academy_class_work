class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(params[:user])
    if user.nil?
      flash.now[:errors] = "Invalid Credentials"
      render :new
    else
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to user_path(user)
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to users_path
  end
end
