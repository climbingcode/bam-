class Logo < ActiveRecord::Base
  belongs_to :brand

  mount_uploader :path, LogoUploader 

end
