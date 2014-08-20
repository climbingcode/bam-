class CreateFonts < ActiveRecord::Migration
  def change
    create_table :fonts do |t|
      t.string :name
      t.string :font_family
      t.references :brand, index: true

      t.timestamps
    end
  end
end
