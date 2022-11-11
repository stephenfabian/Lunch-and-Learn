require 'rails_helper'

RSpec.describe 'Recipes Request Feature' do
  it 'Visiting recipe index shows all recipes for the search term' do

    get api_v1_recipes_path
    expect(response).to be_successful
  end
end