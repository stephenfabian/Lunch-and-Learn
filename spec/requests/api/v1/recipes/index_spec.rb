require 'rails_helper'

RSpec.describe 'Recipes Request Feature', :vcr do
  it 'Visiting recipe index shows the first 10 search results for the given country name' do
    country_params = {country: "thailand"}
    get api_v1_recipes_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(parsed_response[:data]).to be_a(Array)
    expect(parsed_response[:data].count).to eq(10)
    first_recipe = parsed_response[:data].first
    expect(first_recipe).to have_key(:id)
    expect(first_recipe).to have_key(:type)
    expect(first_recipe[:attributes]).to have_key(:title)
    expect(first_recipe[:attributes]).to have_key(:url)
    expect(first_recipe[:attributes]).to have_key(:image)
    expect(first_recipe[:attributes]).to have_key(:image)
  end

  it 'Unnecessary attributes are not included in response' do
    country_params = {country: "thailand"}
    get api_v1_recipes_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    first_recipe = parsed_response[:data].first

    expect(first_recipe.count).to eq(3)
    expect(first_recipe[:attributes].count).to eq(4)
  end

  it 'Empty string search returns empty data array' do
    country_params = {country: ""}
    get api_v1_recipes_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expected_return_value = {
                              "data": []
                            }

    expect(parsed_response).to eq(expected_return_value)
  end

  it 'Search value that doesnt return any recipes, returns empty data array' do
    country_params = {country: "asdfsdfsdfsdfsd"}
    get api_v1_recipes_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expected_return_value = {
                              "data": []
                            }
                            
    expect(parsed_response).to eq(expected_return_value)
  end

  it 'If country is not sent in by the user, country name search arg randomly chosen' do
    allow(CountryNameFacade).to receive(:random_country).and_return('Russia')

    get api_v1_recipes_path
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed_response[:data]).to be_a(Array)
    expect(parsed_response[:data].count).to eq(10)
    first_recipe = parsed_response[:data].first
    expect(first_recipe).to have_key(:id)
    expect(first_recipe).to have_key(:type)
    expect(first_recipe[:attributes]).to have_key(:title)
    expect(first_recipe[:attributes]).to have_key(:url)
    expect(first_recipe[:attributes]).to have_key(:country)
    expect(first_recipe[:attributes]).to have_key(:image)
    expect(first_recipe[:attributes]).to have_key(:image)
  end
end