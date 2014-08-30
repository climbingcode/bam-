class AddOpenColumnToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :open, :boolean, :default => false
  end
end
