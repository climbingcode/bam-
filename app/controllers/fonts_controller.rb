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
    @font = Font.new(
      name: params[:name],
      font_family: params[:font_family],
      brand_id: params[:brand_id]
    )

    respond_to do |format|
      if @font.save
        format.html { redirect_to brand_path(@font.brand_id), notice: 'Font was successfully created.' }
        format.json { render :show, status: :created, location: @font }
      else
        format.html { render :new }
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
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_font
      @font = Font.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def font_params
      params.require(:font).permit(:name, :font_family, :brand_id)
    end
end
