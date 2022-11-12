require 'rails_helper'

RSpec.describe LearningResourceService, :vcr do
  context '#video search' do
    it 'retrieves data from Mr History channel, related to a given country' do
      return_value = LearningResourceService.video_search("Paraguay")

      expect(return_value).to be_a(Hash)
      expect(return_value[:items]).to be_a(Array)
      expect(return_value[:items].count).to eq(1)
      expect(return_value[:items].first).to be_a(Hash)
      expect(return_value[:items].first).to be_a(Hash)
      expect(return_value[:items].first[:snippet][:title]).to be_a(String)
      expect(return_value[:items].first[:id][:videoId]).to be_a(String)
    end
  end

  context '#photo_search_data' do
    it 'retrieves data for 10 photos related to a given country' do
      return_value = LearningResourceService.photo_search("USA")
  
      expect(return_value).to be_a(Hash)
      expect(return_value[:results]).to be_a(Array)
      expect(return_value[:results].count).to eq(10)
      expect(return_value[:results].first[:alt_description]).to be_a(String)
      expect(return_value[:results].first[:urls][:full]).to be_a(String)
    end
  end
end