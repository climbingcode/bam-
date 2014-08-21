class SessionsController < ApplicationController
  
  def new
    @user = User.all
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to brands_path, notice: "Welcome back, #{user.username}!"
    else
      flash.now[:alert] = "Login Failed..."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
