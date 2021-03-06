class ColorsController < ApplicationController
  before_action :set_color, only: [:show, :edit, :update, :destroy]

  # GET /colors
  # GET /colors.json
  def index
    @colors = Color.where("brand_id = ?", params[:brand_id])
    respond_to do | format |
      format.html 
      format.json { render json: @colors, location: user_brand_path(current_user, params[:brand_id])  }
    end

  end

  # GET /colors/1
  # GET /colors/1.json
  def show
  end

  # GET /colors/new
  def new
    @color = Color.new
  end

  # GET /colors/1/edit
  def edit
  end

  # POST /colors
  # POST /colors.json
  def create
    @color = Color.new(color_params)
    if @color.hex[0] == "#"
      @color.hex = @color.hex[1,7];
    end
    respond_to do |format|
      if @color.save  
        format.html { redirect_to user_brand_path(current_user, @color.brand_id), notice: 'Color was successfully created.' }
        format.json { render json: @color, status: :created, location: user_brand_path(current_user, @color.brand_id) }
      else
        format.html { redirect_to user_brand_path(current_user, params[:id]), notice: 'Color was not created.' }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colors/1
  # PATCH/PUT /colors/1.json
  def update
    respond_to do |format|
      if @color.update(color_params)
        format.html { redirect_to @color, notice: 'Color was successfully updated.' }
        format.json { render json: @color, status: :ok, location: @color }
      else
        format.html { render :edit }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colors/1
  # DELETE /colors/1.json
  def destroy
    @color.destroy
    respond_to do |format|
      format.html { redirect_to colors_url, notice: 'Color was successfully destroyed.' }
      format.json { render json: @color, status: :accepted,  location: user_brand_path(current_user, @color.brand_id) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_params
      params.require(:color).permit(:hex, :name, :primary, :brand_id)
    end
end
