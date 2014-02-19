class ShelterController < ApplicationController
  include CurrentConsiderationList
  before_action :set_consideration_list

  def index
  	@pets = Pet.order(:name)
  end
end
