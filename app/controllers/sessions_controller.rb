class SessionsController < ApplicationController

  def new # render :new is implicit here
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    puts params

    if user.nil?
      render json: "Incorrect credentials!"
    else
      user.session_token = User.generate_session_token
      session[:session_token] = user.session_token
      user.save # to store the user's newly assigned session_token in the db
      login_user!(user)
      redirect_to cats_url
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    redirect_to cats_url
  end

end
