class ConsiderationItemsController < ApplicationController
  include CurrentConsiderationList
  before_action :set_consideration_list, only: [:create]
  before_action :set_consideration_item, only: [:show, :edit, :update, :destroy]

  # GET /consideration_items
  # GET /consideration_items.json
  def index
    @consideration_items = ConsiderationItem.all
  end

  # GET /consideration_items/1
  # GET /consideration_items/1.json
  def show
  end

  # GET /consideration_items/new
  def new
    @consideration_item = ConsiderationItem.new
  end

  # GET /consideration_items/1/edit
  def edit
  end

  # POST /consideration_items
  # POST /consideration_items.json
  def create
    #@consideration_item = ConsiderationItem.new(consideration_item_params)
    pet = Pet.find(params[:pet_id])
    @consideration_item = @consideration_list.consideration_items.build(pet: pet)


    respond_to do |format|
      if @consideration_item.save
        format.html { redirect_to shelter_url, notice: 'Consideration item was successfully created.' }
        format.js { @current_item = @consideration_item}
        format.json { render action: 'show', status: :created, location: @consideration_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @consideration_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consideration_items/1
  # PATCH/PUT /consideration_items/1.json
  def update
    respond_to do |format|
      if @consideration_item.update(consideration_item_params)
        format.html { redirect_to @consideration_item, notice: 'Consideration item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consideration_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consideration_items/1
  # DELETE /consideration_items/1.json
  def destroy
    @consideration_item.destroy
    respond_to do |format|
      format.html { redirect_to consideration_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consideration_item
      @consideration_item = ConsiderationItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consideration_item_params
      params.require(:consideration_item).permit(:pet_id, :consideration_list_id)
    end
end
