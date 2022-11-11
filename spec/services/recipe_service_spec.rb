require 'rails_helper'

RSpec.describe RecipeService, :vcr do
  context 'recipe_data_by_country' do
    it 'retrieves receipe data related to a given country' do
      return_value = RecipeService.recipe_data_by_country("USA")
      expect(return_value).to be_a(Hash)
      recipes = return_value[:hits]
      expect(recipes).to be_an(Array)
      expect(recipes.first[:recipe]).to be_a(Hash)
      expect(recipes.first[:recipe][:label]).to be_a(String)
      expect(recipes.first[:recipe][:image]).to be_a(String)
      expect(recipes.first[:recipe][:url]).to be_a(String)
    end

    it 'test if country doesnt exist' do
      return_value = RecipeService.recipe_data_by_country("asdfsdfsdfsdf")
      expect(return_value).to be_a(Hash)
      expect(return_value[:hits]).to eq([])
    end
  end
end