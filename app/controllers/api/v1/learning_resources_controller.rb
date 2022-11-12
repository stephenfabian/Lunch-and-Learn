class Api::V1::LearningResourcesController < ApplicationController

  def index
    @learning_resource = LearningResourceFacade.learning_resource_object(params[:country])
    render json: LearningResourceSerializer.new(@learning_resource) 
  end
end