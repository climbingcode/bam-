class CreateCopies < ActiveRecord::Migration
  def change
    create_table :copies do |t|
      t.string :description
      t.text :text
      t.references :brand, index: true

      t.timestamps
    end
  end
end
