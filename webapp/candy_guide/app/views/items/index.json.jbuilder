json.array!(@items) do |item|
  json.extract! item, :id, :name, :description, :item_type, :image, :latitude, :longitude, :schedule, :city_id
  json.url item_url(item, format: :json)
end
