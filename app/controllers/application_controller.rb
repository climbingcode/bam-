class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to '/'
    end
  end

  def check_permission_status
    if !current_user.user_brands[0].permission == 1
      flash[:alert] = "Sorry, you don't have permission"
      redirect_to user_brands(current_user.id)
    end
  end

  def brand_tracker(brand)
    @current_brand ||= Brand.find(brand.id) if session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  

  helper_method :current_user


end
