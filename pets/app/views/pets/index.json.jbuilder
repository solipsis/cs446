json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :type, :image_url, :age
  json.url pet_url(pet, format: :json)
end
