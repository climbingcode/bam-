class LogosController < ApplicationController


  def create
    @logo = Logo.new(logo_params)
    respond_to do |format|
      if @logo.save
        format.html { redirect_to user_brand_path(current_user, @logo.brand_id), notice: 'Logo was successfully saved.' }
        format.json { render json: @logo, status: :created, location: user_brand_path(current_user, @logo.brand_id) }
      else
        format.json { render json: @logo.errors, status: :unprocessable_entity }
      end
    end
  end

  def download
    @logo = Logo.find(params[:format].to_i)
    @jpeg1 = MiniMagick::Image.open("#{@logo.path.path}") 
    @jpeg1.write "public/uploads/convert/#{@logo.id}.jpg"
    @png1 = MiniMagick::Image.open("#{@logo.path.path}") 
    @png1.write "public/uploads/convert/#{@logo.id}.png"
    @filename = "#{Rails.root}/public/uploads/convert/#{@logo.id}.jpg"
    send_file(@filename,
              :filename => "#{@logo.name}"
      ) 
  end

  def edit
  end

  def update
    respond_to do |format|
      if @logo.update(logo_params)
        format.html { redirect_to @logo, notice: 'Logo was successfully updated.' }
        format.json { render json: @logo , status: :ok, location: @logo }
      else
        format.html { render :edit }
        format.json { render json: @logo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @logo = Logo.find(params[:id])
   
    respond_to do |format|
      @logo.destroy
      format.html { redirect_to logos_url, notice: 'Logo was successfully destroyed.' }
      format.json { render json: @logo, status: :accepted, location: user_brand_path(current_user, @logo.brand_id)}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logo
      @logo = Logo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logo_params
      params.require(:logo).permit(:name, :description, :permission, :path, :brand_id)
    end
end
