require 'rails_helper'

RSpec.describe 'Tourist Sights Search', :vcr do
  it 'Happy path - search with valid country returns collection of all tourist sights within 20000 meter radius of the capital city' do
    country_params = {country: "New Zealand"}
    get api_v1_tourist_sights_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    parsed_response[:data].each do |sight|
      structural_tests(sight)
    end
  end

  it 'Happy path (second country) - search with valid country returns collection of all tourist sights within 20000 meter radius of the capital city' do
    country_params = {country: "France"}
    get api_v1_tourist_sights_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    parsed_response[:data].each do |sight|
      structural_tests(sight)
    end
  end

  it 'Happy path(third_country) - search with valid country returns collection of all tourist sights within 20000 meter radius of the capital city' do
    country_params = {country: "Latvia"}
    get api_v1_tourist_sights_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    parsed_response[:data].each do |sight|
      structural_tests(sight)
    end
  end

  it 'Extension - generate results for random country if no params are sent' do
    allow(CountryNameFacade).to receive(:random_country).and_return("Italy")

    country_params = {country: "asdfasdfasdfasdfsdafasdf"}
    get api_v1_tourist_sights_path, headers: headers
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    parsed_response[:data].each do |sight|
      structural_tests(sight)
    end
  end

  it 'Extension #2 - generate results for random country if country searched is not valid' do
    allow(CountryNameFacade).to receive(:random_country).and_return("Italy")

    get api_v1_tourist_sights_path, headers: headers
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    parsed_response[:data].each do |sight|
      structural_tests(sight)
    end
  end
  
  def structural_tests(sight)
     expect(sight).to have_key(:id)
    expect(sight[:type]).to eq("tourist_sight")  
    expect(sight[:attributes]).to have_key(:name)
    expect(sight[:attributes]).to have_key(:address)
    expect(sight[:attributes]).to have_key(:place_id)
  end
end