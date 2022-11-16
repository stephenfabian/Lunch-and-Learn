require 'rails_helper'

RSpec.describe CountryNameFacade, :vcr do
  context '#random_country' do
    it 'selects random country from CountryNames service data' do
     rand_obj1 = CountryNameFacade.random_country
     rand_obj2 = CountryNameFacade.random_country

     expect(rand_obj1).to_not eq(rand_obj2)
    end
  end
end