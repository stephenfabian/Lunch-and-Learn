require 'rails_helper'

RSpec.describe VideoService, :vcr do
  context '#video search' do
    it 'retrieves data from Mr History channel, related to a given country' do
      return_value = VideoService.video_search("Paraguay")

      expect(return_value).to be_a(Hash)
      expect(return_value[:items]).to be_a(Array)
      expect(return_value[:items].first).to be_a(Hash)
      expect(return_value[:items].first).to be_a(Hash)
      expect(return_value[:items].first[:snippet][:title]).to be_a(String)
      expect(return_value[:items].first[:snippet][:title]).to be_a(String)
      expect(return_value[:items].first[:id][:videoId]).to be_a(String)
    end
  end
end