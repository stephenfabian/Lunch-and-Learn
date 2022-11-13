require 'rails_helper'

RSpec.describe 'Favorites Create Request' do
  before :each do
    user_params = {
                    "name": "Stephen Fabian",
                    "email": "stephenfabian@gmail.com"
                  }
    
    headers = { "ACCEPT" => "application/json" }
    post api_v1_users_path, :params => user_params, :headers => headers
  end

  it 'can create favorite in db for a user, and return success message and status 201 when sent valid json payload' do
    params_for_favorite = { "api_key"=> User.last.api_key, 
                            "favorite" => {
                                            "country": "thailand",
                                            "recipe_link": "https://www.tastingtable.com",
                                            "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
                                          }
                          }

    headers = { "ACCEPT" => "application/json" }               
    post api_v1_favorites_path, :params => params_for_favorite, :headers => headers
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    success_message = {
                        "success": "Favorite added successfully"
                      }
    
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(parsed_response).to eq(success_message)
    expect(Favorite.last.country).to eq(params_for_favorite['favorite'][:country])
    expect(Favorite.last.recipe_link).to eq(params_for_favorite['favorite'][:recipe_link])
    expect(Favorite.last.recipe_title).to eq(params_for_favorite['favorite'][:recipe_title])
  end

  it 'if no user with api key, return status 400 and error message explaining what went wrong' do
    params_for_favorite = { "api_key"=> 1111111111111, 
                            "favorite" => {
                                            "country": "thailand",
                                            "recipe_link": "https://www.tastingtable.com",
                                            "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
                                          }
                          }

    failure_message = {"error": "cannot find user with given api key"}
    headers = { "ACCEPT" => "application/json" }   
    post api_v1_favorites_path, :params => params_for_favorite, :headers => headers
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(parsed_response).to eq(failure_message)
  end
end