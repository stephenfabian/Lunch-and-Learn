class PlaceFacade < PlaceService
  #name
  #formatted address
  #placeID

  def self.create_tourist_sights_obj(long, lat)
    sights_data = search_by_long_lat(long, lat)
    sights_data[:features].map do |sight|
      sights_attributes_hash = {}
      if !sight[:properties][:name]
        sights_attributes_hash[:name] = "Unnamed Sight"
      else
        sights_attributes_hash[:name] = sight[:properties][:name]
      end
      sights_attributes_hash[:address] = formatted_address(sight)
      sights_attributes_hash[:place_id] = sight[:properties][:place_id]
      TouristSight.new(sights_attributes_hash)
    end
  end

  def self.formatted_address(single_country_data)
    address1 = single_country_data[:properties][:address_line1]
    address2 = single_country_data[:properties][:address_line2]
    address = "#{address1}, #{address2}"
  end
end