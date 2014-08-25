class SessionsController < ApplicationController
  
  def new
    @user = User.all
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.brands.count == 1
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

  def destroy
    session.clear
    redirect_to '/'
  end
end
