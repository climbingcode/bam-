class MiscAsset < ActiveRecord::Base
  belongs_to :brand

  mount_uploader :thumbnail, AssetsUploader

end
