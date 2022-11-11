class Api::V1::RecipesController < ApplicationController

  def index
    if !params[:country]
      random_country_name = CountryNameFacade.random_country
      @recipes = RecipeFacade.create_recipe_poros(random_country_name)
    else
      @recipes = RecipeFacade.create_recipe_poros(params[:country])
    end
    render json: RecipeSerializer.new(@recipes) 
  end
end
