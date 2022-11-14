class Api::V1::RecipesController < ApplicationController
  def index
    country_name = params[:country] || CountryNameFacade.random_country
    @recipes = RecipeFacade.create_recipe_poros(country_name)
    render json: RecipeSerializer.new(@recipes) 
  end
end
