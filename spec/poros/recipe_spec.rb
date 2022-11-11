require 'rails_helper'

RSpec.describe Recipe do
  it 'instantiates and has attributes' do
    attributes_hash =  {
                        :label=>"Usa-Style Pancake Recipe",
                        :url=>"http://www.jamieoliver.com/recipes/other-recipes/pancakes-usa-stylie",
                        :image=> "sdfsdlfskdjflds"
                      }
    recipe1 = Recipe.new(attributes_hash)

    expect(recipe1).to be_a(Recipe)
  end
end