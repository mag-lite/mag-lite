class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.where(:id => session[:user_id]).first
    else
      nil
    end
  end
  
  # Set the currently logged-in user
  # 
  # user - User to set as the current user, or nil to log out
  def current_user=(user)
    if user
      @current_user     = user
      session[:user_id] = user.id
    else
      @current_user     = nil
      session[:user_id] = nil
    end
  end

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def admin?
    logged_in? && current_user.group.admin?
  end
  helper_method :admin?

  # Helper to restrict controller access to specific users
  #
  # Example:
  #
  #   before_filter :login_required, :except => [:index, :show]
  def login_required
    access_denied unless logged_in?
  end

  def access_denied
    redirect_to login_path, :notice => 'Access denied. Please sign in.'
  end

end
