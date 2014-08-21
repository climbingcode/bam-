class AddPrivateColumnToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :private, :boolean
  end
end
