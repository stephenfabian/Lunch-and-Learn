require 'rails_helper'

RSpec.describe LearningResource do
  it 'instantiates and has attributes' do
    attributes_hash = {
                      :country=> "USA",
                      :video=> {:title=>"A Super Quick History of the Dominican Republic", :youtube_video_id=>"egn4uBVuasM"},
                      :images=> 
                                [{:alt_tag=>"Demonstrators walk along a street holding signs demanding the right to vote and equal civil rights at the March on Washington",
                                  :url=>"https://images.unsplash.com/photo-1597711662967-b5da"},
                                {:alt_tag=>"people standing and holding white and black banner during daytime",
                                  :url=>"https://images.unsplash.com/photo-"}]
                      }

    lr = LearningResource.new(attributes_hash)

    expect(lr).to be_a(LearningResource)
    expect(lr.id).to eq(nil)
    expect(lr.country).to eq(attributes_hash[:country])
    expect(lr.video).to eq(attributes_hash[:video])
    expect(lr.images).to eq(attributes_hash[:images])
  end
end