class GuidelinesController < ApplicationController
  before_action :set_guideline, only: [:show, :edit, :update, :destroy]

  # GET /guidelines
  # GET /guidelines.json
  def index
    @guidelines = Guideline.all
  end

  # GET /guidelines/1
  # GET /guidelines/1.json
  def show
  end

  # GET /guidelines/new
  def new
    @guideline = Guideline.new
  end

  # GET /guidelines/1/edit
  def edit
  end

  # POST /guidelines
  # POST /guidelines.json
  def create
    @guideline = Guideline.new(guideline_params)

    respond_to do |format|
      if @guideline.save
        format.html { redirect_to @guideline, notice: 'Guideline was successfully created.' }
        format.json { render :show, status: :created, location: @guideline }
      else
        format.html { render :new }
        format.json { render json: @guideline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guidelines/1
  # PATCH/PUT /guidelines/1.json
  def update
    respond_to do |format|
      if @guideline.update(guideline_params)
        format.html { redirect_to brand_path(@guideline.brand_id), notice: 'Guideline was successfully updated.' }
        format.json { render :show, status: :ok, location: @guideline }
      else
        format.html { render :edit }
        format.json { render json: @guideline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guidelines/1
  # DELETE /guidelines/1.json
  def destroy
    @guideline.destroy
    respond_to do |format|
      format.html { redirect_to guidelines_url, notice: 'Guideline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guideline
      @guideline = Guideline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guideline_params
      binding.pry
      params.require(:guideline).permit(:description, :text, :brand_id)
    end
end
