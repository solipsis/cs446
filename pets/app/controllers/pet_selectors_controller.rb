class PetSelectorsController < ApplicationController
  before_action :set_pet_selector, only: [:show, :edit, :update, :destroy]

  # GET /pet_selectors
  # GET /pet_selectors.json
  def index
    @pet_selectors = PetSelector.all
    @testParam = 5
  end

  # GET /pet_selectors/1
  # GET /pet_selectors/1.json
  def show

  end

  # GET /pet_selectors/new
  def new
    @pet_selector = PetSelector.new
    @testParam = 3
  end

  # GET /pet_selectors/1/edit
  def edit
  end

  # POST /pet_selectors
  # POST /pet_selectors.json
  def create
    @pet_selector = PetSelector.new(pet_selector_params)
    
    respond_to do |format|
      if @pet_selector.save
        format.html { redirect_to @pet_selector, notice: 'Pet selector was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pet_selector }
      else
        format.html { render action: 'new' }
        format.json { render json: @pet_selector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_selectors/1
  # PATCH/PUT /pet_selectors/1.json
  def update()
    
    respond_to do |format|
      if @pet_selector.update(pet_selector_params)
        format.html { redirect_to @pet_selector, notice: 'Pet selector was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pet_selector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_selectors/1
  # DELETE /pet_selectors/1.json
  def destroy
    @pet_selector.destroy
    respond_to do |format|
      format.html { redirect_to pet_selectors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_selector
      @pet_selector = PetSelector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_selector_params
      params[:pet_selector]
    end
end
