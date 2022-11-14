class PlaceService
  def self.place_conn
    Faraday.new(
      url: 'https://api.geoapify.com/v2/places',
      params: { apiKey: ENV['places_key'] }
    )
  end

  def self.geocode_conn
    Faraday.new(
      url: 'https://api.geoapify.com/v1/geocode/search',
      params: { apiKey: ENV['places_key'] }
    )
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end

  def self.geocode(place)
    response = geocode_conn.get("?text=#{place}")
    parse(response)
  end

  def self.search_by_place_id(place_id, category)
    response = place_conn.get("?filter=place:#{place_id}&categories=#{category}&limit=5")
    parse(response)
  end
end

#for getting locations coords and place_idd
#https://api.geoapify.com/v1/geocode/search
#apiKey 
#params - text