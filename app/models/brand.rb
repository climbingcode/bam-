class Brand < ActiveRecord::Base
	has_many :logos
	has_many :colors
	has_many :fonts
	has_many :copies
	has_many :guidelines
	has_many :misc_assets
	has_many :users, through: :user_brands 

	validates :name, :website, presence: true

	extend FriendlyId
  friendly_id :name, use: :slugged

  def self.does_brand_exist?(brand_name)
  	Brand.find_by(name: brand_name).present?
  end

  
  
end
