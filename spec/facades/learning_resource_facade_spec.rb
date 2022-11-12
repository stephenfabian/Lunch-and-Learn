require 'rails_helper'

RSpec.describe LearningResourceFacade, :vcr do
  context '#video_details' do
    it 'for given country - returns hash containing video title and id' do
      return_value = LearningResourceFacade.video_details("USA")

      expect(return_value).to be_a(Hash)
      expect(return_value).to have_key(:title)
      expect(return_value).to have_key(:youtube_video_id)
    end
  end

  context 'edge case - #video_details' do
    it 'returns [] if country searched returns no video matches' do
      return_value = LearningResourceFacade.video_details("asdfsafsdfasdf")

      expect(return_value).to eq([])
    end
  end

  context '#image_details' do
    it 'for given country - returns array of alt tags and urls for each image' do
      return_value = LearningResourceFacade.image_details("USA")

      return_value.each do |image_details|
        expect(image_details).to have_key(:alt_tag)
        expect(image_details).to have_key(:url)
      end
    end
  end
    
  context '#learning_resource_object' do
    it 'for given country - returns learning resource object' do
      return_value = LearningResourceFacade.learning_resource_object("USA")
      
      expect(return_value).to be_a(LearningResource)
    end
  end
end