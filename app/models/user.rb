class User < ActiveRecord::Base
	has_many :brands, through: :user_brands  
end
