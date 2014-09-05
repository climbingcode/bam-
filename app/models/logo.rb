class Logo < ActiveRecord::Base
  belongs_to :brand

  mount_uploader :path, LogoUploader 

  def self.to_hash_of_name_and_path(logos)
  	new_array = {}
  	logos.each do |logo|
			new_array[logo.name] = logo.path.url
  	end
  	new_array
  end

end
