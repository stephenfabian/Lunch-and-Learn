class Api::V1::RecipesController < ApplicationController

  def index
    @recipes = RecipeFacade.create_recipe_poros(params[:country])
    @single_recipe_test = @recipes.first
    # require 'pry'; binding.pry
    render json: RecipeSerializer.new(@recipes)
    
  end
end
