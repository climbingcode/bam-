class LogosController < ApplicationController
  # before_action :set_logo, only: [:show, :edit, :update, :destroy]


  # POST /logos
  # POST /logos.json
  def create
    @logo = Logo.new(logo_params)

    respond_to do |format|
      if @logo.save
        @jpeg1 = MiniMagick::Image.open("#{@logo.path.path}") 
        @jpeg1.write "public/uploads/convert/#{@logo.id}.jpg"
        @png1 = MiniMagick::Image.open("#{@logo.path.path}") 
        @png1.write "public/uploads/convert/#{@logo.id}.png"
        
        format.html { redirect_to user_brand_path(current_user, @logo.brand_id), notice: 'Logo was successfully saved.' }
        format.json { render json: @logo, status: :created, location: user_brand_path(current_user, @logo.brand_id) }
        # render :show, status: :created, location: user_brand_path(current_user, @logo.brand_id)
      else
        # format.html { redirect_to user_brand_path(current_user, @logo.brand_id), notice: 'Logo was not saved.' }
        format.json { render json: @logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /logos
  # GET /logos.json
  # def index
  #   @logos = Logo.all
  # end

  # # GET /logos/1
  # # GET /logos/1.json
  # def show
  # end

  # # GET /logos/new
  # def new
  #   @logo = Logo.new
  # end

  # GET /logos/1/edit
  def edit
  end



  # PATCH/PUT /logos/1
  # PATCH/PUT /logos/1.json
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

  # DELETE /logos/1
  # DELETE /logos/1.json
  def destroy
    @logo = Logo.find(params[:id])
    @logo.destroy
    respond_to do |format|
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
