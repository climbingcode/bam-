class UserBrand < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand

end
