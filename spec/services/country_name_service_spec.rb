require 'rails_helper'

RSpec.describe CountryNameService, :vcr do
  context 'country_data' do
   it 'retrieves all country data' do
      return_value = CountryNameService.country_data

      expect(return_value).to be_an(Array)
    end
  end
end