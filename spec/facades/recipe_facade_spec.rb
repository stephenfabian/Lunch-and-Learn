require 'rails_helper'

RSpec.describe RecipeFacade, :vcr do 
  context '#create_recipe_poros' do
    it 'takes country as arg, and returns recipe objects' do
      return_value = RecipeFacade.create_recipe_poros("USA")

      expect(return_value).to be_a(Array)
    end

    it 'invalid search arg' do
      return_value = RecipeFacade.create_recipe_poros("asdfsdfsdfsdfsd")

      expect(return_value).to eq([])
    end

    it 'empty string arg' do
      return_value = RecipeFacade.create_recipe_poros("asdfsdfsdfsdfsd")
      
      expect(return_value).to eq([])
    end
  end
end