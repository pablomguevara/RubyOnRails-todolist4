class SessionsController < ApplicationController
  
  skip_before_action :ensure_login, only: [:new, :create]
  
  def new
  end

  def create
   #  * get the user's `username` and `password` from the submitted form
   #  * find the user based on `username`
   #  * authenticate the user using the supplied `password`
   #  * if authenticated
   #    - store the user.id in the `session`
   #    - redirect the caller to the `root_path` of the application and supply a 
   #    flash.notice message announcing successful login
   #  * if not authenticated
   #    - redirect the caller to the `login_path` and supply an flash.alert message
   user = User.find_by(username: params[:user][:username])
   password = params[:user][:password]

   if user && user.authenticate(password)
     session[:user_id] = user.id
     redirect_to root_path, notice: "Logged in successfully"
   else
   	 redirect_to login_path, alert: "Invalid user/password combination"
   end
  end

  def destroy
  	reset_session
  	redirect_to login_path, notice: "You have been logged out"
  end
end
