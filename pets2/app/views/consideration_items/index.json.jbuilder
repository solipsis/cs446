json.array!(@consideration_items) do |consideration_item|
  json.extract! consideration_item, :id, :pet_id, :consideration_list_id
  json.url consideration_item_url(consideration_item, format: :json)
end
