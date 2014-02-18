module CurrentConsiderationList
	extend ActiveSupport::Concern

	private

	  def set_consideration_list
	  	@consideration_list = ConsiderationList.find(session[:consideration_list_id])
	  rescue ActiveRecord::RecordNotFound
	  	@consideration_list = ConsiderationList.create
	  	session[:consideration_list_id] = @consideration_list.id
	  end
end