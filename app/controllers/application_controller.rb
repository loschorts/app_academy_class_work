class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception
   helper_method :current_user, :ensure_logged_in

   def login!(user)
     @current_user = user
     session[:session_token] = user.session_token
   end

   def current_user
     @current_user ||= User.find_by(session_token: session[:session_token])
   end

   def ensure_logged_in
     unless current_user
       flash[:errors] = "You must log in to view that page"
       redirect_to new_session_url
     end
   end
end
