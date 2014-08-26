class PdfsController < ApplicationController
	
  def new

  end

  def create

  end
  
  def business_card
  	@brand = Brand.find(session[:current_brand])
    @user = current_user
    @colors = @brand.colors

    respond_to do |format|
      format.html
      format.pdf do
        render  :pdf => "_business_card.pdf.erb",
                :page_height => '3.5in', 
                :page_width => '5.3in',
                :margin => {:top => 5,                     # default 10 (mm)
                :bottom => 5,
                :left => 5,
                :right => 5}
      end
    end
  end
end
