class Api::V1::RecipesController < ApplicationController
  def index
    country_name = params[:country] || CountryNameFacade.random_country
    if params[:country] &&  !valid_country?(params[:country]) 
      render json: {failure: "Country name invalid"}, status: 400 
    else
      @recipes = RecipeFacade.create_recipe_poros(country_name)
      render json: RecipeSerializer.new(@recipes) 
    end
  end
end
