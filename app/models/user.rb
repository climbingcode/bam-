class User < ActiveRecord::Base

	has_secure_password

	validates_confirmation_of :password
	
	has_many :user_brands
	has_many :brands, through: :user_brands 




end
