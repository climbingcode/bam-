class MiscAssetsController < ApplicationController
  before_action :set_misc_asset, only: [:show, :edit, :update, :destroy]

  # GET /misc_assets
  # GET /misc_assets.json
  def index
    @misc_assets = MiscAsset.all
  end

  # GET /misc_assets/1
  # GET /misc_assets/1.json
  def show
  end

  # GET /misc_assets/new
  def new
    @misc_asset = MiscAsset.new
  end

  # GET /misc_assets/1/edit
  def edit
  end

  # POST /misc_assets
  # POST /misc_assets.json
  def create
    @misc_asset = MiscAsset.new(misc_asset_params)

    respond_to do |format|
      if @misc_asset.save
        format.html { redirect_to user_brand_path(current_user, @misc_asset.brand_id), notice: 'Misc asset was successfully created.' }
        format.json { render :show, status: :created, location: @misc_asset }
      else
        format.html { redirect_to user_brand_path(current_user, @misc_asset.brand_id), notice: 'Misc asset was not saved.'}
        format.json { render json: @misc_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /misc_assets/1
  # PATCH/PUT /misc_assets/1.json
  def update
    respond_to do |format|
      if @misc_asset.update(misc_asset_params)
        format.html { redirect_to @misc_asset, notice: 'Misc asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @misc_asset }
      else
        format.html { render :edit }
        format.json { render json: @misc_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /misc_assets/1
  # DELETE /misc_assets/1.json
  def destroy
    @misc_asset.destroy
    respond_to do |format|
      format.html { redirect_to misc_assets_url, notice: 'Misc asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_misc_asset
      @misc_asset = MiscAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def misc_asset_params
      params.require(:misc_asset).permit(:name, :description, :thumbnail, :permissions, :brand_id)
    end
end
