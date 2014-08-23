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
   
  end


end
