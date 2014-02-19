json.array!(@foster_agreements) do |foster_agreement|
  json.extract! foster_agreement, :id, :pet_id
  json.url foster_agreement_url(foster_agreement, format: :json)
end
