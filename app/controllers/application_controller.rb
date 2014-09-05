class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_cache_buster

  protected

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def tracked_search_brands(brands)
    @searched_results = ""
    brands.each do |brand|
       searched_results << brand.id.to_s
    end
  end

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to '/'
    end
  end

  def check_if_admin?
    current_user.user_brands.find_by(brand_id: session[:current_brand]).permission == 1
  end

  def redirect_to_brands_page_if_signed_in
    if current_user
      if current_user.brands.count > 1
        redirect_to user_brands_path(current_user.id)
      elsif current_user.brands.count == 1
        redirect_to user_brand_path(current_user.id, session[:current_brand])
      end
    end
  end

  def check_permission_status
      awaiting_admin = current_user.user_brands.find_by(brand_id: session[:current_brand]) 
      if awaiting_admin != nil && awaiting_admin.permission == 4 
          session[:user_id] = nil
          session[:current_brand] = nil
          redirect_to '/', notice: "Sorry, waiting on admin permission"
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
