class BrandController < ApplicationController

  def show 

    @brand = Brand.find_by(name: params[:id])

    if @brand != nil
      @colors = @brand.colors
      @fonts = @brand.fonts 
      @logos = @brand.logos
  
    else 
      redirect_to '/', notice: "sorry this brand does not exist:("
    end
  end

end
