class UsersController < ApplicationController

	include UsersHelper

	def index 
		@brands = Brand.all
	end

	def new
		@disable_nav = false
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@brandname = params[:name]

      if @user.save
      	if !first_time_brand?(params[:name])
      		@user.brands.create(name: params[:name], website: params[:website])
      		if set_user_to_admin(@user, @brandname)
      			session[:user_id] = @user.id
      			redirect_to user_brands_path(@user.id), notice: 'You have full access to the site'
      		else
      			redirect_to :new, notice: 'Sorry account did not save correctly'
      		end
     		else
      		send_email_to_admin(params[:name], @user.id)
      		redirect_to '/', notice: 'Waiting for account holder to grant access'
      	end 
    	else
    		redirect_to :new, notice: 'Sorry there was problems saving you account'
    	end
  end


	private
   
    def user_params
  		params.require(:user).permit(:firstname, :lastname, :email, :username, :position, :password, :password_confirmation)
    end
	
end
