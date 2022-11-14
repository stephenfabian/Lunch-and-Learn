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
      country_hash = {:name=>"New Zealand",
      :topLevelDomain=>[".nz"],
      :alpha2Code=>"NZ",
      :alpha3Code=>"NZL",
      :callingCodes=>["64"],
      :capital=>"Wellington",
      :altSpellings=>["NZ", "Aotearoa"],
      :subregion=>"Australia and New Zealand",
      :region=>"Oceania",
      :population=>5084300,
      :latlng=>[-41.0, 174.0]
          }

      return_value = CountryNameFacade.coordinates(country_hash)
    end
  end
end

