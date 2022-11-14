require 'rails_helper'

RSpec.describe PlaceFacade, :vcr do
  it 'returns array of tourist_sights poros with service data' do
    return_value = PlaceFacade.create_tourist_sights_obj(174.0, -41.0)

    expect(return_value). to be_a(Array)
    return_value.each do |tourist_sight|
      expect(tourist_sight).to be_a(TouristSight)
    end
  end
end