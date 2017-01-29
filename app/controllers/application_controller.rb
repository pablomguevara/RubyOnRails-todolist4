class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_login
  helper_method :logged_in?, :current_user

  protected
    def ensure_login
      redirect_to login_path unless session[:user_id]
    end

    def logged_in?
      # evaluates to true if there is a logged in user
      session[:user_id]
    end

    def current_user
      # return the current user if set, if not find it based on the session info
      @current_user ||= User.find(session[:user_id])
    end
end
