require 'rails_helper'

RSpec.describe 'Favorites Create Request' do
  it 'Happy path - can create favorite in db for a user, and return success message and status 201 when sent valid json payload' do
    user1 = User.create(name: "Tommy Fabian", email: "stephenfabian@gmail.com", api_key: 999999999999991)
    params =  { "api_key"=> user1.api_key, 
                    "favorite" => {
                                  "country": "thailand",
                                  "recipe_link": "https://www.tastingtable.com",
                                  "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"                                         
                                   }
              }

    post api_v1_favorites_path, :headers => headers, params: params
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    success_message = {
                        "success": "Favorite added successfully"
                      }
    
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(parsed_response).to eq(success_message)
    expect(user1.favorites.last.country).to eq(params['favorite'][:country])
    expect(user1.favorites.last.recipe_link).to eq(params['favorite'][:recipe_link])
    expect(user1.favorites.last.recipe_title).to eq(params['favorite'][:recipe_title])
  end

  it 'Sad path - if no user with api key, return status 400 and error message explaining what went wrong' do
    user1 = User.create(name: "Tommy Fabian", email: "stephenfabian@gmail.com", api_key: 999999999999991)
    params =  { "api_key"=> 6666666666666, 
                "favorite" => {
                              "country": "thailand",
                              "recipe_link": "https://www.tastingtable.com",
                              "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"                                         
                                }
              }

    failure_message = {"error": "cannot find user with given api key"}
    post api_v1_favorites_path, :headers => headers, params: params
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(parsed_response).to eq(failure_message)
  end

  it 'Edge case - invalid params' do
    user1 = User.create(name: "Tommy Fabian", email: "stephenfabian@gmail.com", api_key: 999999999999991)
      params =  { "api_key"=> 6666666666666, 
                "favorite" => {
                              "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"                                         
                                }
                }

    post api_v1_favorites_path, :headers => headers, params: params
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end