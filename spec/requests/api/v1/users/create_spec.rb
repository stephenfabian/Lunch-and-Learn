require 'rails_helper'

RSpec.describe 'User Create Request' do
  it 'Happy path - user info sent in post request creates a user in db, and renders 201 and user attributes' do
    params = {
              "name": "Stephen Fabian",
              "email": "stephenfabian@gmail.com"
            }
    
    headers = { "ACCEPT" => "application/json" }
    post api_v1_users_path, :params => params, :headers => headers
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(User.last.name).to eq(params[:name])
    expect(response.status).to eq(201)
    expect(parsed_response[:data][:type]).to eq("user")
    expect(parsed_response[:data][:id].to_i).to be_a(Integer)
    attributes = parsed_response[:data][:attributes]
    expect(attributes[:name]).to eq(params[:name])
    expect(attributes[:email]).to eq(params[:email])
    expect(attributes[:api_key]).to be_a(Integer)
  end

  it 'Sad path - user email is not unique, returns appropriate error message' do
    params_for_first_request = {
                "name": "Stephen Fabian",
                "email": "stephenfabian@gmail.com"
              }
    
    headers = { "ACCEPT" => "application/json" }
    post api_v1_users_path, :params => params_for_first_request, :headers => headers

    params_for_second_request = {
                "name": "Tommy Fabian",
                "email": "stephenfabian@gmail.com"
              }
    
    headers = { "ACCEPT" => "application/json" }
    post api_v1_users_path, :params => params_for_second_request, :headers => headers
    parsed_response = JSON.parse(response.body, symbolize_names: true)    

    expect(response).to_not be_successful
    expect(parsed_response[:error]).to eq("email must be unique")
  end
end