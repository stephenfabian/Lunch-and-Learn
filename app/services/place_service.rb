class PlaceService
  def self.conn
    Faraday.new(
      url: 'https://api.geoapify.com/v2/places',
      params: { apiKey: ENV['places_key'] }
    )
  end


  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end


  def self.search_by_long_lat(long, lat)
    response = conn.get("?filter=circle:#{long},#{lat},20000&categories=tourism.sights&limit=5")
    parse(response)
  end
end

#for getting locations coords and place_idd
#https://api.geoapify.com/v1/geocode/search
#apiKey 
#params - text