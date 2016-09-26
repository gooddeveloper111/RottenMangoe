class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected 

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    current_user.admin == true || user.is_impersonating?
  end

  def is_impersonating?
    session[:admin_id]
  end

  helper_method :current_user

  helper_method :admin?

  helper_method :is_impersonating?

  
end
