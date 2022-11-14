class PlaceFacade < PlaceService
  #name
  #formatted address
  #placeID

  def self.create_tourist_sights_obj(long, lat)
    sights_data = search_by_long_lat(long, lat)
    # address = 
    sights_data[:features].map do |sight|
      # require 'pry'; binding.pry
      sights_attributes_hash = {}
      sights_attributes_hash[:name] = sight[:properties][:name]
      sights_attributes_hash[:address] = formatted_address(sight)
      sights_attributes_hash[place_id] = sight[:properties][:place_id]
    end
  end
#name
#street
  def self.formatted_address(single_country_data)
require 'pry'; binding.pry

  end
end