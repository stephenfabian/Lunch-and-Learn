require 'rails_helper'

RSpec.describe PlaceService, :vcr do

  it 'can get place info data for a given place_id' do
    return_value = PlaceService.search_by_long_lat(174.0, -41.0)
    require 'pry'; binding.pry
  end
end