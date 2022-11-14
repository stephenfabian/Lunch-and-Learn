require 'rails_helper'

RSpec.describe PlaceService, :vcr do
  it 'can get geocoding data for a given place' do
    return_value = PlaceService.geocode("Golden, CO") 
  end

  it 'can get place info data for a given place_id' do
    return_value = PlaceService.search_by_place_id("51b58993fb1d4e5ac059caf55be097e04340f00101f9014cb6010000000000c00208", "accommodation")

  end
end