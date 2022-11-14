require 'rails_helper'

RSpec.describe PlaceFacade, :vcr do
  it 'can create a tourist_sights poro with service data' do
    return_value = PlaceFacade.create_tourist_sights_obj(174.0, -41.0)

  end
end