require 'rails_helper'

RSpec.describe CountryNameFacade, :vcr do
  context '#random_country' do
    it 'returns randomly selected country name from CountryName Service response' do
      return_value = CountryNameFacade.random_country

      expect(return_value).to be_a(String)
    end
  end

  context '#capital_long_lat' do
    it 'returns capital city long/lat (in that order) for given country' do
      return_value = CountryNameFacade.capital_long_lat("New Zealand")

      expect(return_value).to be_an(Array)
      expect(return_value.first).to be_a(Float)
      expect(return_value.second).to be_a(Float)
    end
  end

  context '#coordinates' do
    it 'selects long lat(in that order) from country hash' do
      country_hash = {
                      :name=>"New Zealand",
                      :latlng=>[-41.0, 174.0]
                    }

      return_value = CountryNameFacade.coordinates(country_hash)
      expect(return_value).to eq([174.0, -41.0])
    end
  end

  context '#valid_country?' do
    it 'returns boolean if country is valid or not' do
      correct_return_value = CountryNameFacade.valid_country?("France")
      incorrect_return_value = CountryNameFacade.valid_country?("sdlfkjwelofikwejof")

      expect(correct_return_value).to eq(true)
      expect(incorrect_return_value).to eq(false)
    end
  end
end

