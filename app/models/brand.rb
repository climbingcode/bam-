class Brand < ActiveRecord::Base
	has_many :logos
	has_many :colors
	has_many :fonts
	has_many :copies
	has_many :guidelines
	has_many :misc_assets
	has_many :users, through: :user_brands 
end
