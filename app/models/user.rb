class User < ActiveRecord::Base
	has_many :user_brands
	has_many :brands, through: :user_brands 

end
