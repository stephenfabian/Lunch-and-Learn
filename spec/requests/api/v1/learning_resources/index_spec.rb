require 'rails_helper' 

RSpec.describe 'Learning Resource Search Feature', :vcr do
  it 'Happy path - searching for a learning resource with a valid country name returns learning resource' do
    country_params = {country: "USA"}
    get api_v1_learning_resources_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    structural_test(parsed_response, country_params)
  end

  it 'Happy path - searching with a valid country name returns learning resource (second country)' do
    country_params = {country: "Italy"}
    get api_v1_learning_resources_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    structural_test(parsed_response, country_params)
  end

  it 'Sad path - no search matches returns empty object' do
    country_params = {country: "aasdfsdfsadfsadfsdfwef"}
    get api_v1_learning_resources_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response[:data][:id]).to eq(nil)
    expect(parsed_response[:data][:type]).to eq("learning_resource")
    attributes = parsed_response[:data][:attributes]
    expect(attributes[:country]).to eq(country_params[:country])
    expect(attributes[:video]).to eq([])
    expect(attributes[:images]).to eq([])
  end

  def structural_test(parsed_response, country_params)  
    expect(parsed_response[:data][:id]).to eq(nil)
    expect(parsed_response[:data][:type]).to eq("learning_resource")
    attributes = parsed_response[:data][:attributes]
    expect(attributes[:country]).to eq(country_params[:country])
    expect(attributes[:video]).to have_key(:title)
    expect(attributes[:video]).to have_key(:youtube_video_id)
    attributes[:images].each do |image|
      expect(image).to have_key(:alt_tag)
      expect(image).to have_key(:url)
    end
  end
end