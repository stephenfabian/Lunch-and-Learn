require 'rails_helper'

RSpec.describe CountryNameService, :vcr do
  it 'retrieves data for all country names' do
    return_value = CountryNameService.country_names_data

    expect(return_value).to be_an(Array)
    expect(return_value.first[:name]).to be_a(String)
    expect(return_value.second[:name]).to be_a(String)
  end
end