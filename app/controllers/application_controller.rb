class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.admin?
  end

  def require_admin
    if !current_admin
      flash[:alert] = 'You must be an admin'
      redirect_to root_path
    end
  end
end
