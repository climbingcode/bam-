class UsersController < ApplicationController

	include UsersHelper


	def index 
    @user = User.new
		@brands = Brand.all
	end

	def new
		@disable_nav = false
		@user = User.new
    @brand = Brand.new
	end

	def create
		@user = User.new(user_params)
		@brand = Brand.find_by(name: params[:name].downcase)
    if @user.save
      if !@brand 
        if @user.brands.create(name: params[:name], website: params[:website]).save
      	  @brand = @user.brands.last
          session[:current_brand] = @brand.id
          session[:user_id] = @user.id
          set_user_to_admin(@user, @brand.name)
      		redirect_to user_brand_path(@user.id, @brand.id), notice: 'You have full access to the site'
      	else
     			render :new, notice: "Please enter a brand"
     		end
   		else
        session[:current_brand] = @brand.id
     		send_email_to_admin(params[:name], @user)
        awaiting_admin_confirmation(@user, @brand)
     		redirect_to '/', notice: 'Waiting for account holder to grant access'
 	    end 
    else
    	render :new
    end
  end

  def edit 
    @user = User.find(current_user.id)
    @current_brand = Brand.find(session[:current_brand])
    @employee = User.find(params[:id]) 
  end

  # add brands through account panel
  def add_brand
    if Brand::does_brand_exist?(params[:name])
      if current_user.brands.create(name: params[:name], website: params[:website]).save
        brand = current_user.brands.last 
        current_user.user_brands.find_by(brand_id: brand.id).update(permission: 4)
        redirect_to user_brand_path(current_user.id, session[:current_brand]), notice: "Awaiting confirmation form admin"
      else 
        redirect_to user_brand_path(current_user.id, session[:current_brand]), notice: "Sorry there where issues with saving the brand"
      end
    else
      if current_user.brands.create(name: params[:name], website: params[:website]).save
        brand = current_user.brands.last
        current_brand(brand)
        current_user.assign_user_to_admin(brand)
        redirect_to user_brand_path(current_user.id, brand.id)
      else
        redirect_to user_brand_path(current_user.id, session[:current_brand]), notice: "Sorry there where issues with saving the brand"
      end
    end
  end

  def update
    user = User.find(params[:id])
    permission = params[:permission]
    if permission == "Update / View Users and Assets"
      user.user_brands.find_by(brand_id:  params[:brand].to_i).update(permission: 1)
      flash[:alert] = "'#{user.firstname} has been given view/update assets and username only permissions'"
      redirect_to user_brand_path(current_user.id, session[:current_brand]) 
    elsif permission == "Update / View Assets Only" 
      user.user_brands.find_by(brand_id:  params[:brand].to_i).update(permission: 2)
      flash[:alert] = "'#{user.firstname} has been given view/update assets only permissions'"
      redirect_to user_brand_path(current_user.id, session[:current_brand])
    elsif permission == "View Only"
      user.user_brands.find_by(brand_id:  params[:brand].to_i).update(permission: 3)
      flash[:alert] =  "'#{user.firstname} has been given view only permissions'"
      redirect_to user_brand_path(current_user.id, session[:current_brand]) 
    else
      user.user_brands.find_by(brand_id:  params[:brand].to_i).delete.save
      flash[:alert] = 'No update created'
      redirect_to user_brand_path(current_user.id, session[:current_brand])
    end 
  end


	private
   
    def user_params
  		params.require(:user).permit(:firstname, :surname, :email, :username, :position, :password, :password_confirmation)
    end
	
end
