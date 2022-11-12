require 'rails_helper'

RSpec.describe LearningResourceFacade, :vcr do
  it 'calls to LearningResourceService, uses data to create LearningResource poro' do
    return_value = LearningResourceService.video_search("Paraguay")
    
  end
end