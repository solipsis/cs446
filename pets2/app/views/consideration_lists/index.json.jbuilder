json.array!(@consideration_lists) do |consideration_list|
  json.extract! consideration_list, :id
  json.url consideration_list_url(consideration_list, format: :json)
end
