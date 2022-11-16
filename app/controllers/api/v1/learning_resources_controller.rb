class Api::V1::LearningResourcesController < ApplicationController
  def index
    country_name = params[:country] || CountryNameFacade.random_country
    if params[:country] && !valid_country?(params[:country]) 
      render json: {failure: "Country name invalid"}, status: 400 
    else
      @learning_resource = LearningResourceFacade.learning_resource_object(country_name)
      render json: LearningResourceSerializer.new(@learning_resource) 
    end
  end
end