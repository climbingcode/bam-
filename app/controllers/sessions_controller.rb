class SessionsController < ApplicationController
  
  def new
    @user = User.all
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.brands.count == 0
        brands = Brand.all
        redirect_to search_results_path(brands)
      elsif @user.brands.count == 1
        session[:current_brand] = @user.brands[0].id
        redirect_to user_brand_path(@user.id, @user.brands[0].id), notice: "Welcome back, #{@user.username}!"
      else 
        redirect_to user_brands_path(@user.id)
      end
    else
      flash.now[:alert] = "Login Failed..."
      redirect_to users_path
    end
  end

  # signs in at search brands
  def sign_in_at_search
    @user = User.find_by(username: params['/sign_in_at_search'][:username])
    if @user && @user.authenticate(params['/sign_in_at_search'][:password])
      session[:user_id] = @user.id
      redirect_to search_results_path
    else 
      redirect_to search_results_path, notice: "sorry, we could not find your account"
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
