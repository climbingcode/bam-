class Brand < ActiveRecord::Base
	has_many :logos, :colors, :fonts, :copies ,:guidelines, :misc_assets
	has_many :users, through: :user_brands 
end
