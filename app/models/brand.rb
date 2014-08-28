class Brand < ActiveRecord::Base
	has_many :logos
	has_many :colors
	has_many :fonts
	has_many :copies
	has_many :guidelines
	has_many :misc_assets
	has_many :users, through: :user_brands 

	
  before_create :check_brand_params
  before_update :check_brand_params

	validates :name, :website, presence: true

	extend FriendlyId
  friendly_id :name, use: :slugged


	def check_brand_params
		self.name.downcase
	end

  def self.does_brand_exist?(brand_name)
  	Brand.find_by(name: brand_name).present?
  end

  
  
end
