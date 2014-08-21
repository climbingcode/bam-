class UsersController < ApplicationController

	def index 
		@brands = Brand.all
	end

	def new
		@disable_nav = false
		@user = User.new
	end

	def create
		@user = User.new(user_params)
      if @user.save
      	@user.brands.create(name: params[:name], website: params[:website])
      	session[:user_id] = @user.id
        redirect_to user_brands_path(@user.id)
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
