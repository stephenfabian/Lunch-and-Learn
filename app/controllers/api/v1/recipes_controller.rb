class Api::V1::RecipesController < ApplicationController

  def index
    @recipes = RecipeFacade.create_recipe_poros(params[:_json])
    require 'pry'; binding.pry
  end
end
