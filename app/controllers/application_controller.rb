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

  def check_if_admin?
    current_user.user_brands.find_by(brand_id: session[:current_brand]).permission == 1
  end

  def check_permission_status
      awaiting_admin = current_user.user_brands.find_by(brand_id: session[:current_brand]) 
      if awaiting_admin != nil
        if awaiting_admin.permission == 4
          session[:user_id] = nil
          session[:current_brand] = nil
          redirect_to '/', notice: "Sorry, waiting on admin permission"
        end
      end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_brand(brand)
    session[:current_brand] = brand.id
  end

  helper_method :current_user
  helper_method :brand_tracker
  helper_method :check_permission_status
  helper_method :check_if_admin?

end
