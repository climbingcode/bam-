class UserBrand < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand

 	def display_permission_status

 	end 

end
