require 'rails_helper' 

RSpec.describe 'Learning Resource Search Feature', :vcr do
  it 'Happy path - searching for a learning resource with a valid country name returns learning resource' do
    country_params = {country: "thailand"}
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

  it 'Extension - Sad path - invalid country name returns status 400 and appropriate error message' do
    country_params = {country: "aasdfsdfsadfsadfsdfwef"}
    get api_v1_learning_resources_path, headers: headers, params: country_params
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to eq({failure: "Country name invalid"})
    expect(response.status).to eq(400)
  end

  it 'Extension - Edge case - no country name returns learning resources for randomly generated country' do
    allow(CountryNameFacade).to receive(:random_country).and_return('Italy')
    get api_v1_learning_resources_path
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    country_params = {country: "Italy"}
    expect(response).to be_successful
    structural_test(parsed_response, country_params)
  end

  def structural_test(parsed_response, country_params)  
    expect(parsed_response[:data][:id]).to eq(nil)
    expect(parsed_response[:data][:type]).to eq("learning_resource")
    attributes = parsed_response[:data][:attributes]
    expect(attributes.count).to eq(3)
    require 'pry'; binding.pry
    expect(attributes[:country]).to eq(country_params[:country])
    expect(attributes[:video]).to have_key(:title)
    expect(attributes[:video]).to have_key(:youtube_video_id)
    attributes[:images].each do |image|
      expect(image).to have_key(:alt_tag)
      expect(image).to have_key(:url)
    end
  end
end