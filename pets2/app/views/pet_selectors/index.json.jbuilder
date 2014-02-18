json.array!(@pet_selectors) do |pet_selector|
  json.extract! pet_selector, :id
  json.url pet_selector_url(pet_selector, format: :json)
end
