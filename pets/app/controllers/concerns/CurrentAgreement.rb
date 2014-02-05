module CurrentAgreement
	extend ActiveSupport::Concern

	private

	def set_agreement
		@agreement = Agreement.find(session[:agreement_id])
	rescue ActiveRecord::RecordNotFound
		@agreement = Agreement.create
		session[:agreement_id] = @agreement.id
	end
end