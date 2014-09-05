class BrandsController < ApplicationController

  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  before_filter :restrict_access, only: [:show, :create, :update, :destroy]

  before_filter :check_permission_status, only: [:show, :create, :update, :destroy]

  # GET /brands
  # GET /brands.json
  def index
    @user = User.find(params[:user_id].to_i)
    @brands = @user.brands
  end

  def mailer

  end

  # methods for view only and ask for access
  def search_brand
    @disable_nav = false
    search = params['/search_brand'][:search].downcase
    @brands = Brand.where('name LIKE ?', "%#{search}%")
    tracked_brands = @brands.pluck(:id).join(' ')
    cookies[:tracked_brands] = tracked_brands
      if params['/search_brand'][:search] == ""
        redirect_to users_path, notice: 'sorry, you need to enter something'
      elsif @brands == nil
        redirect_to users_path, notice: 'sorry, no brands where found'
      else 
        redirect_to search_results_path
      end
  end

  def search_results
    @user_brand = current_user.brands if current_user
    @user ||= User.find(current_user.id) if current_user
    @all_brands = Brand.all
  end
  # GET /brands/1
  # GET /brands/1.json
  def change_privacy
    brand = Brand.find(params[:brands_id].to_i)
    if brand.open == true 
      brand.open = false 
      brand.save
    else 
      brand.open = true
      brand.save
    end 
    respond_to do |format|
      format.json { render json: {:msg => 'successful'} }
    end
  end

  def show
      session[:current_brand] = params[:id].to_i
      @user = User.find(params[:user_id])
      @brand = Brand.find(params[:id]) 
      @brands = @user.brands
      @colors = @brand.colors.all
      @logos = @brand.logos.all
      @logos_to_json = @logos.to_hash_of_name_and_path(@logos)
      @fonts = @brand.fonts.all
      @copies = @brand.copies.all
      @guidelines = @brand.guidelines.all
      @misc_assets = @brand.misc_assets.all
      current_brand(@brand)
      @colors = @brand.colors
      @images = @brand.logos
      
      respond_to do |format|
        format.html
        format.js { render :json => @logos_to_json }
      end
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
