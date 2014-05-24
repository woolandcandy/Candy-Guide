class Api::V1::Itinerary::ItinerariesController < ApplicationController
  respond_to :json

  # Method: GET 
  def listcities
    payload = []

    City.all.each do |city|
      payload.push({
        "id" => city.id,
        "name" => city.name,
        "description" => city.description,
        "image" => city.image,
        "latitude" => city.latitude,
        "longitude" => city.longitude
      })
    end

    return render json: payload
  end

  # Method: GET
  # Parameter: id
  def activities
    if city = City.find(params[:id])
      items = []
      city.items.each do |item|
        items.push({
          'id' => item.id,
          'name' => item.name,
          'description' => item.description,
          'type' => item.item_type,
          'image' => item.image,
          'latitude' => item.latitude,
          'longitude' => item.longitude,
          'schedule' => item.schedule
          })
      end

      payload = {
        'city' => {
          'id' => city.id,
          'name' => city.name
        },
        'items' => items
      }

      return render json: payload
    else
      return render json: invalid_request("City not exist")
    end
  end

  private

  def invalid_request(message) 
    payload = {
      'status' => {
        'code' => 200,
        'success' => false, 
        'message' => message
      }
    }
  end
end