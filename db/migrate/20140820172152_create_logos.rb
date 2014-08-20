class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.string :path
      t.boolean :permission
      t.string :description
      t.string :name
      t.references :brand, index: true

      t.timestamps
    end
  end
end
