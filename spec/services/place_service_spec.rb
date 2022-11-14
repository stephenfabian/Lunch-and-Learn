require 'rails_helper'

RSpec.describe PlaceService, :vcr do
  context '#search_by_long_lat' do
    it 'can get place info data for a given place_id' do
      return_value = PlaceService.search_by_long_lat(174.0, -41.0)

      expect(return_value).to be_a(Hash)
      return_value[:features].each do |sight|
        properties = sight[:properties]
        expect(properties).to have_key(:formatted)
        expect(properties).to have_key(:place_id)
      end
    end
  end
end