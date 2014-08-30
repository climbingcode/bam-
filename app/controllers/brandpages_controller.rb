class BrandpagesController < ApplicationController


	def show
		if params[:slug].present?
			brand = Brand.find_by(name: params[:slug])
		else 
			brand = Brand.find(params[:id])
		end

		if current_user
			if brand.open || (current_user.user_brands.find_by(brand_id: brand.id).permission <= 3)
				session[:current_brand] = brand.id
				@colors = brand.colors 
				@logos = brand.logos 
				@fonts = brand.fonts
			else 
				redirect_to search_results_path, notice: 'Sorry, this page is locked'
			end 
		else 
			cookies[:tracked_brands] = brand.id
			redirect_to search_results_path, notice: 'Sorry, you have to be logged in to view a page'
		end
	end
end
 