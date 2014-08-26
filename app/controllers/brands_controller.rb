class BrandsController < ApplicationController

  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  before_filter :restrict_access

  before_filter :check_permission_status
  # GET /brands
  # GET /brands.json
  def index
    @user = User.find(params[:user_id].to_i)
    @brands = @user.brands
  end

  def mailer

  end

  # GET /brands/1
  # GET /brands/1.json
  def show
      if params[:search].present?
        @search = Brand.find_by(name: params[:search])
        redirect_to brand_index_path
      else
        @user = User.find(params[:user_id])
        @brand = @user.brands
      end
      @user = User.find(params[:user_id])
      @brand = Brand.find(params[:id])
      @brands = @user.brands
      # @colors = @brand.colors.all
      @logos = @brand.logos.all
      current_brand(@brand)
      @colors = @brand.colors
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  def search

  end

  # GET /brands/1/edit
  def edit

  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to user_brand_path, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brands/1
  # PATCH/PUT /brands/1.json
  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to @brand, notice: 'Brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to brands_url, notice: 'Brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find_by(name: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_params
      params[:brand]
    end
end
