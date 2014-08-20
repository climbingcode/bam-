class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :hex
      t.string :name
      t.boolean :primary
      t.references :brand, index: true

      t.timestamps
    end
  end
end
