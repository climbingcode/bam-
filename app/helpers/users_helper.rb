module UsersHelper

# access permissions
# 1 = full access to whole of site
# 4 = Awaiting admin confirmation

	def set_user_to_admin(user, brand)
		brand_id = Brand.find_by(name: brand).id
		user.user_brands.find_by(brand_id: brand_id).update(permission: 1)
		return true if user.save  
	end

	def awaiting_admin_confirmation(user, brand)
		brand_id = brand.id
		user.user_brands.create(user_id: user.id, brand_id: brand_id, permission: 4)
	end

	def find_email_info(brandname, user)
		users = []
		brand = Brand.find_by(name: brandname)
		userbrand = UserBrand.where("brand_id = ? AND permission = 1", brand.id)
		userbrand.each do |connect|
			user = User.find(connect.user_id) 
			users << user
		end 
		users 
	end

	def send_email_to_admin(brandname, user)
		joined_account = user
		users = find_email_info(brandname, user)
		users.each do |current_user| 
			UserMailer.access_email(current_user, joined_account).deliver
		end	
	end

	def find_all_users_with_brand
		users = []
		UserBrand.all.each do |user_brand|
			if user_brand.brand_id == session[:current_brand] 
				users << User.find(user_brand.user_id)
			end
		end
		users
	end

end
