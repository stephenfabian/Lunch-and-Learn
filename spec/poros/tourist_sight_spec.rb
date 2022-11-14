require 'rails_helper'

RSpec.describe TouristSight do
  it 'instantiates and has attributes' do
    attributes_hash = {
                        :name=>"Historic gun emplacement",
                        :address=>"Historic gun emplacement, Bulwer Road, New Zealand",
                        :place_id=>"51ed32fc6163656d656e74"
                      }

    sight1 = TouristSight.new(attributes_hash)    

    expect(sight1).to be_a(TouristSight)        
    expect(sight1.name).to eq(attributes_hash[:name])
    expect(sight1.address).to eq(attributes_hash[:address])
    expect(sight1.place_id).to eq(attributes_hash[:place_id])
  end
end