class CreateUserBrands < ActiveRecord::Migration
  def change
    create_table :user_brands do |t|
      t.references :user, index: true
      t.references :brand, index: true
      t.integer :permission

      t.timestamps
    end
  end
end
