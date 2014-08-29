class FontsController < ApplicationController
  before_action :set_font, only: [:show, :edit, :update, :destroy]

  # GET /fonts
  # GET /fonts.json
  def index
    @fonts = Font.all
  end

  # GET /fonts/1
  # GET /fonts/1.json
  def show
  end

  # GET /fonts/new
  def new
    @font = Font.new
  end

  # GET /fonts/1/edit
  def edit
  end

  # POST /fonts
  # POST /fonts.json
  def create
    @font = Font.new(font_params)
    # binding.pry
    respond_to do |format|
      if @font.save
        format.html { redirect_to user_brand_path(current_user, @font.brand_id), notice: 'Font was successfully saved.' }
        format.json { render json: @font, status: :created, location: user_brand_path(current_user, @font.brand_id) }
      else
        format.html { redirect_to user_brand_path(current_user, @font.brand_id), notice: 'Font was not saved.' }
        format.json { render json: @font.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fonts/1
  # PATCH/PUT /fonts/1.json
  def update
    respond_to do |format|
      if @font.update(font_params)
        format.html { redirect_to @font, notice: 'Font was successfully updated.' }
        format.json { render :show, status: :ok, location: @font }
      else
        format.html { render :edit }
        format.json { render json: @font.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fonts/1
  # DELETE /fonts/1.json
  def destroy
    @font.destroy
    respond_to do |format|
      format.html { redirect_to fonts_url, notice: 'Font was successfully destroyed.' }
      format.json { render json: @font, status: :accepted, location: user_brand_path(current_user, @font.brand_id) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_font
      @font = Font.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def font_params
      params.require(:font).permit(:font_family, :brand_id)
    end
end
