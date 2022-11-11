require 'rails_helper'

RSpec.describe RecipeFacade, :vcr do 
  context '#create_recipe_poros' do
    it 'takes country as arg, and returns recipe objects' do
      return_value = RecipeFacade.create_recipe_poros("USA")

      expect(return_value).to be_a(Array)
    end
  end
end