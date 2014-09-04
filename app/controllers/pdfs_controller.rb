class PdfsController < ApplicationController
	
  def new
<<<<<<< HEAD
    @pdf = Pdf.new
  end

  def create
    @brand = Brand.find(session[:current_brand])
    logo_path = @brand.logos.find_by(name: params[:pdf][:logo]).path.path if @brand.logos.present?
    brand_id = @brand.id
    user_id = current_user.id
    @pdf = @brand.pdfs.new(
      kind: params[:pdf][:kind],
      primary_color: params[:pdf][:primary_color],
      secondary_color: params[:pdf][:secondary_color],
      logo: logo_path,
      font: params[:pdf][:font],
      border: params[:pdf][:border],
      street_number: params[:pdf][:street_number],
      street_address: params[:pdf][:street_address],
      post_code: params[:pdf][:post_code],
      number: params[:pdf][:number]
      )
    if @pdf.save
        show_pdf(current_user, @brand, @pdf)
    else 
      redirect_to user_brand_path(user_id, brand_id), notice: "Sorry, there was a issue generating this pdf"   
    end
  end

  def show_pdf(user, brand, pdf)
    @pdf = pdf
    @brand = Brand.find(brand.id)   
    @kind = pdf.kind
    @logo = pdf.logo
    @border = pdf.border
    @primary_color = pdf.primary_color
    @secondary_color = pdf.secondary_color
    @font = pdf.font


    render  :pdf => "#{@type}_#{@brand.id}.pdf",
            :template => "pdfs/#{@kind}.pdf.erb",
            :layout   => 'layouts/wicked.html.erb' 
  end

end
