class CreateGuidelines < ActiveRecord::Migration
  def change
    create_table :guidelines do |t|
      t.string :description
      t.string :text
      t.references :brand, index: true

      t.timestamps
    end
  end
end
