require 'rails_helper'

RSpec.describe RecipeService, :vcr do
  context 'recipe_data_by_country' do
    it 'retrieves receipe data related to a given country' do
      return_value = RecipeService.recipe_data_by_country("USA")

      expect(return_value).to be_a(Hash)
    end
  end
end