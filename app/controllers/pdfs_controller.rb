class PdfsController < ApplicationController
	
  def new

  end

  def create

  end
  
  def business_card
  	@brand = Brand.find(session[:current_brand])
    @user = current_user
    @colors = @brand.colors
    @images = @brand.logos


    respond_to do |format|
      format.json do
        render :json => @colors
        render :json => @images
      end

      format.html
      format.pdf do
        render  :pdf => "business_card_#{@brand.id}.pdf",
                :template => 'pdfs/business_card.pdf.erb',
                :layout   => 'layouts/wicked.html.erb',  
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