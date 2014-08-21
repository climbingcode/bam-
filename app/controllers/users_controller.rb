class UsersController < ApplicationController

	def index 
		@users = User.all
	end

	def new
		@disable_nav = true
		@user = User.new
	end

	def create
		@user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to brands_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @brand }
        session[:user_id] = @user.id
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
