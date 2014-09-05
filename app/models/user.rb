class User < ActiveRecord::Base

	has_secure_password

	validates_confirmation_of :password

	# validates :firstname, :surname, :username, :email, presence: true
	# validates :username, uniqueness: true
	# validates :username, :password, length: { minimum: 6 }
	
	has_many :user_brands
	has_many :brands, through: :user_brands 


	before_create :check_params

	def check_params
		self.username.downcase
		self.firstname.downcase
		self.surname.downcase
	end

# has user been give permissions / use to check when loading page 
	def user_given_permissions(brand_id)
		permission = self.user_brands.find_by(brand_id: brand_id).permission
		return true if (permission == 1) || (permission == 2) || (permission == 3) 
	end

# will display users permissions for each brand
	def display_permission_status(brand)
		permission = self.user_brands.find_by(brand_id: brand.id).permission
		
			if permission == 1
				return "Can View/Update Accounts and Assets"
			elsif permission == 2
				return "Can View/Update Assets Only"
			elsif permission == 3
				return "View Only"
			else 
				return "Permission has not been granted by account owner"
			end
 	end 

# returns true if user has admin permissions
 	def user_has_admin_permissions?(brand)
 		if self.user_brands.find_by(brand_id: brand).present?
 			return true if self.user_brands.find_by(brand_id: brand).permission == 1
 		else
 			brand = Brand.find(brand)
 			self.user_brands.create(user_id: self.id, brand_id: brand.id, permission: 4)
 		end
 	end

# assign user with admin status
	def assign_user_to_admin(brand)
		self.user_brands.find_by(brand_id: brand.id).update(permission: 1)
	end

# finds all users awaiting for permissions for a single brand
 	def self.users_awaiting_permission(brand)
 		awaiting_users = []
 		users = User.all
 		connection = UserBrand.where("brand_id = ? AND permission = 4", brand.id)
 		connection.each do |connect|
 			awaiting_users << User.find(connect.user_id)
 		end
 		return awaiting_users
 	end

end
