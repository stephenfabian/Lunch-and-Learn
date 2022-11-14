require 'rails_helper'

RSpec.describe CountryNameFacade, :vcr do
  it 'returns randomly selected country name from CountryName Service response' do
    return_value = CountryNameFacade.random_country

    expect(return_value).to be_a(String)
  end

  it 'returns capital city long/lat (in that order) for given country' do
     return_value = CountryNameFacade.capital_long_lat("New Zealand")

     expect(return_value).to eq([174.0, -41.0])
  end
end
