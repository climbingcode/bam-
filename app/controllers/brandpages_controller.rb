class BrandpagesController < ApplicationController


	def show
		if params[:slug].present?
			@brand = Brand.find_by(name: params[:slug])
		else 
			@brand = Brand.find(params[:id])
		end

		if @brand.open 
			@colors = @brand.colors 
			@logos = @brand.logos 
			@fonts = @brand.fonts
			@copies = @brand.copies
			@guidelines = @brand.guidelines 
		else 

			redirect_to search_results_path, notice: "Sorry, this brand is not public"
		end 

	end
end
 