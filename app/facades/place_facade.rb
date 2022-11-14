class PlaceFacade < PlaceService
  def self.create_tourist_sights_obj(long, lat)
    sights_data = search_by_long_lat(long, lat)
    sights_data[:features].map do |sight|
      sights_attributes_hash = {}
      sights_attributes_hash[:name] = sight[:properties][:name] || "Unnamed Sight"
      sights_attributes_hash[:address] = sight[:properties][:formatted]
      sights_attributes_hash[:place_id] = sight[:properties][:place_id]
      TouristSight.new(sights_attributes_hash)
    end
  end
end