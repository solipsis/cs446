class FosterAgreementsController < ApplicationController
  before_action :set_foster_agreement, only: [:show, :edit, :update, :destroy]

  # GET /foster_agreements
  # GET /foster_agreements.json
  def index
    @foster_agreements = FosterAgreement.all
  end

  # GET /foster_agreements/1
  # GET /foster_agreements/1.json
  def show
  end

  # GET /foster_agreements/new
  def new
    @foster_agreement = FosterAgreement.new
  end

  # GET /foster_agreements/1/edit
  def edit
  end

  # POST /foster_agreements
  # POST /foster_agreements.json
  def create
    if (@foster_agreement) 
      destroy
    end
    
    @foster_agreement = FosterAgreement.new(foster_agreement_params)

    respond_to do |format|
      if @foster_agreement.save
        format.html { redirect_to @foster_agreement, notice: 'Foster agreement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @foster_agreement }
      else
        format.html { render action: 'new' }
        format.json { render json: @foster_agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foster_agreements/1
  # PATCH/PUT /foster_agreements/1.json
  def update
    respond_to do |format|
      if @foster_agreement.update(foster_agreement_params)
        format.html { redirect_to @foster_agreement, notice: 'Foster agreement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @foster_agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foster_agreements/1
  # DELETE /foster_agreements/1.json
  def destroy
    @foster_agreement.destroy
    respond_to do |format|
      format.html { redirect_to shelter_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foster_agreement
      @foster_agreement = FosterAgreement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foster_agreement_params
      #params.require(:foster_agreement).permit(:pet_id)
      p = {pet_id: params[:pet_id]}
    end
end
