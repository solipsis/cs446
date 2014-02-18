class ConsiderationListsController < ApplicationController
  before_action :set_consideration_list, only: [:show, :edit, :update, :destroy]

  # GET /consideration_lists
  # GET /consideration_lists.json
  def index
    @consideration_lists = ConsiderationList.all
  end

  # GET /consideration_lists/1
  # GET /consideration_lists/1.json
  def show
  end

  # GET /consideration_lists/new
  def new
    @consideration_list = ConsiderationList.new
  end

  # GET /consideration_lists/1/edit
  def edit
  end

  # POST /consideration_lists
  # POST /consideration_lists.json
  def create
    @consideration_list = ConsiderationList.new(consideration_list_params)

    respond_to do |format|
      if @consideration_list.save
        format.html { redirect_to @consideration_list, notice: 'Consideration list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @consideration_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @consideration_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consideration_lists/1
  # PATCH/PUT /consideration_lists/1.json
  def update
    respond_to do |format|
      if @consideration_list.update(consideration_list_params)
        format.html { redirect_to @consideration_list, notice: 'Consideration list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consideration_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consideration_lists/1
  # DELETE /consideration_lists/1.json
  def destroy
    @consideration_list.destroy
    respond_to do |format|
      format.html { redirect_to consideration_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consideration_list
      @consideration_list = ConsiderationList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consideration_list_params
      params[:consideration_list]
    end
end
