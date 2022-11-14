require 'rails_helper'

RSpec.describe 'Favorites Index Request' do
  before :each do
    user1 = User.create(name: "Will Williamson", email: "will@gmail.com", api_key: 111111111111111)
    user2 = User.create(name: "John Johnson", email: "j@gmail.com", api_key: 222222222222222)
    user3 = User.create(name: "Ethan Ethanson", email: "e@gmail.com", api_key: 333333333333333)

    user1.favorites.create(country: "Italy", recipe_link: "https://www.tastaibela.com", recipe_title: "Macaroni")
    user1.favorites.create(country: "Italy", recipe_link: "https://www.tastaibela.com/morefood", recipe_title: "Pasta")
    user2.favorites.create(country: "USA", recipe_link: "https://www.tastaibela.com", recipe_title: "Sandwiches")
  end

  it 'Happy path (user with multiple favorites) - request with valid api_key returns favorites for user ' do
    params = { "api_key": "111111111111111" }
    headers = { "ACCEPT" => "application/json" }               
    get api_v1_favorites_path, :params => params, :headers => headers
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(parsed_response[:data].count).to eq(2)
    parsed_response[:data].each do |favorite|
      structural_tests(favorite)
    end
  end

  it 'Happy path (user with one favorite) - request with valid api_key returns favorite for user' do
    params = { "api_key": "222222222222222" }
    headers = { "ACCEPT" => "application/json" }               
    get api_v1_favorites_path, :params => params, :headers => headers
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(parsed_response[:data].count).to eq(1)
    parsed_response[:data].each do |favorite|
      structural_tests(favorite)
    end
  end

  it 'Sad path - api_key valid, user has no favorites' do
    params = { "api_key": "333333333333333" }
    headers = { "ACCEPT" => "application/json" }               
    get api_v1_favorites_path, :params => params, :headers => headers
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expected_response = { "data": [] }

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(parsed_response).to eq(expected_response)
  end

  it 'Edge case - api_key invalid, user not found' do
    params = { "api_key": "55555555555555" }
    headers = { "ACCEPT" => "application/json" }               
    get api_v1_favorites_path, :params => params, :headers => headers
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expected_response = {"error": "cannot find user with given api key"}

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(parsed_response).to eq(expected_response)
  end

  def structural_tests(favorite)
    expect(favorite[:attributes].count).to eq(5)
    expect(favorite[:attributes]).to have_key(:id)
    expect(favorite[:attributes]).to have_key(:recipe_title)
    expect(favorite[:attributes]).to have_key(:recipe_link)
    expect(favorite[:attributes]).to have_key(:country)
    expect(favorite[:attributes]).to have_key(:created_at)
  end
end