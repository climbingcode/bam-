class CreateMiscAssets < ActiveRecord::Migration
  def change
    create_table :misc_assets do |t|
      t.string :name
      t.string :description
      t.string :thumbnail
      t.boolean :permissions
      t.references :brand, index: true

      t.timestamps
    end
  end
end
