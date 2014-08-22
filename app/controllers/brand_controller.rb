class BrandController < ApplicationController
  
  def show
  	@brand = Brand.find_by(name: params[:id])
      if @brand == nil 
        redirect_to '/', notice: 'This Brand does not exist'
      end
  end

end
