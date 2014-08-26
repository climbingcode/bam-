class PdfsController < ApplicationController
	
  def business_card
  	@brand = Brand.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "_business_card.pdf.erb"
      end
    end
  end
end
