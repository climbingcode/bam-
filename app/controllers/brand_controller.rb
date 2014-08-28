class BrandController < ApplicationController

  def search_brand 
    search = params['/search_brand'][:search].downcase
    @brands = Brand.find_by(name: search)

      if params['/search_brand'][:search] == ""
        redirect_to users_path, notice: 'sorry, you need to enter something'
      elsif @brands == nil
        redirect_to users_path, notice: 'sorry, no brands where found'
      else 
        redirect_to brand_index_path(@brands)
      end
  end

  def index
    @brands = Brand.where('name = ?', params[:format])
  end

  def show
    @brand = Brand.find_by(name: params[:format])
    @colors = @brand.colors
    @fonts = @brand.fonts 
    @logos = @brand.logos
  end

end
