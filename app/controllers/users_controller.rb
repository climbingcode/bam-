class UsersController < ApplicationController

	def index 
		@users = User.all
	end

	def new
		@disable_nav = false
		@user = User.new
	end

	def create
		@brand = params[:brand]
		@user = User.new(user_params)
      if @user.save
      	@user.brands.create(name: params[:name], website: params[:website])
      	session[:user_id] = @user.id
        redirect_to brand_path(@user.brands[0].id)
      end
  end

	def show

	end

	def edit
	end

	def update 
	end

	def destroy
	end

	private
   
    def user_params
  		params.require(:user).permit(:firstname, :lastname, :email, :username, :position, :password, :password_confirmation)
    end
	
end
