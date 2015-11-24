class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(username,
    params[:user][:password]
    )
    if user
      login!(user)
      redirect_to goals_url
    else
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  private
  def username
    params[:user][:username]
  end

end
