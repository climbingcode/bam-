class SessionController < ApplicationController
  
  def new
  end

  def create

    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to brands_path, notice: "Welcome back, #{user.username}!"
    else
      flash.now[:alert] = "Login Failed..."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "You are not logged out."
  end

end
