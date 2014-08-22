module UsersHelper

# access permissions
# 1 = full access to whole of site

	def first_time_brand?(brandname)
		Brand.find_by(name: brandname).present?
	end

	def set_user_to_admin(user, brand)
		brand_id = Brand.find_by(name: brand).id
		user.user_brands.find_by(brand_id: brand_id).update(permission: 1)
		return true if user.save 
	end

	def send_email_to_admin(brandname, user)
		binding.pry
		brand = Brand.find_by(name: brandname)			

	end


end
