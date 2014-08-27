class BrandController < ApplicationController
  
  def index
    @brands = Brand.all
    
    if params[:search]
      @brands = Brand.search(params[:search])
    else
      @brands = Brand.all
    end
  end


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
