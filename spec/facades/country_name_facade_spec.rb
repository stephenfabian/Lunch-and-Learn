require 'rails_helper'

RSpec.describe CountryNameFacade, :vcr do
  it 'returns randomly selected country name from CountryName Service response' do
    return_value = CountryNameFacade.random_country

    expect(return_value).to be_a(String)
  end
end
