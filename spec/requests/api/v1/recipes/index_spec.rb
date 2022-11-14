require 'rails_helper'

RSpec.describe 'Recipes Request Feature', :vcr do
  it 'Happy path - Visiting recipe index shows search results for the given country name' do
    country_params = {country: "thailand"}
    get api_v1_recipes_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(parsed_response[:data]).to be_a(Array)

    parsed_response[:data].each do |recipe|
      structural_tests(recipe)
    end
  end

  it 'Unnecessary attributes are not included in response' do
    country_params = {country: "thailand"}
    get api_v1_recipes_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    parsed_response[:data].each do |recipe|
      expect(recipe.count).to eq(3)
      expect(recipe[:attributes].count).to eq(4)
    end
  end

  it 'Sad path - Empty string search returns empty data array' do
    country_params = {country: ""}
    get api_v1_recipes_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expected_return_value = {
                              "data": []
                            }

    expect(parsed_response).to eq(expected_return_value)
  end

  it 'Sad path - Search value that doesnt return any recipes, returns empty data array' do
    country_params = {country: "asdfsdfsdfsdfsd"}
    get api_v1_recipes_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expected_return_value = {
                              "data": []
                            }
                            
    expect(parsed_response).to eq(expected_return_value)
  end

  it 'Edge case - If country is not sent in by the user, country name search arg randomly chosen' do
    allow(CountryNameFacade).to receive(:random_country).and_return('Russia')
    get api_v1_recipes_path
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed_response[:data]).to be_a(Array)
    expect(parsed_response[:data].count).to eq(10)

    parsed_response[:data].each do |recipe|
      structural_tests(recipe)
    end
  end
  
  def structural_tests(recipe)
      expect(recipe).to have_key(:id)
      expect(recipe).to have_key(:type)
      expect(recipe[:attributes]).to have_key(:title)
      expect(recipe[:attributes]).to have_key(:url)
      expect(recipe[:attributes]).to have_key(:country)
      expect(recipe[:attributes]).to have_key(:image)
      expect(recipe[:attributes]).to have_key(:image)
  end
end