class Permission::UsersController < ApplicationController

	before_filter :restrict_access

	before_filter :check_permission_status

	def index
		@user = User.all
	end

	def show
		users = []
		admin = current_user
		brands = current_user.brands
		brands.each do |brand| 
			relation = UserBrand.where('user_id = ? AND brand_id = ?', admin.id, brand.id)[0].user_id
			users << User.find(relation)
		end
		@users = users
	end

	def edit
		@user = User.find(params[:id])
	end

end
