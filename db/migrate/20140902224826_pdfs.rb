class Pdfs < ActiveRecord::Migration
  
  def change
  	create_table :pdfs do |t|
	  	t.references :brand 
	  	t.string :kind 
	  	t.string :primary_color
	  	t.string :secondary_color
	  	t.string :logo 
	  	t.string :font
	  	t.boolean :border 
	  	t.string :street_number
	  	t.string :street_address
	  	t.string :city 
	  	t.string :post_code 
	  	t.string :number 
  	end
  end
end
