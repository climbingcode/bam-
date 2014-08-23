class User < ActiveRecord::Base

	has_secure_password

	validates_confirmation_of :password
	
	has_many :user_brands
	has_many :brands, through: :user_brands 

	def self.display_permission_status(user)
		user.user_brands.each do |brand|
			brandname = Brand.find(brand.brand_id).name
			permission = brand.permission

			if permission == 1
				return "Can View/Update Accounts and Assets"
			elsif permission == 2
				return "Can View/Update Assets Only"
			else 
				return "View Only"
			end
		end		
 	end 

 	def user_has_admin_permissions?(brand)
 		userbrands = UserBrand.where("user_id = ? AND brand_id = ? AND permission = 1", self.id, brand.id).present?
 	end

 	def self.users_awaiting_permission(brand)
 		awaiting_users = []
 		users = User.all
 		users.each do |user|
 			connection = UserBrand.where("user_id = ? AND brand_id = ? AND permission = 4", user.id, brand.id)
 			connection.each do |connect|
 				awaiting_users << User.find(connect.user_id)
 			end
 		end
 		return awaiting_users
 	end

end
