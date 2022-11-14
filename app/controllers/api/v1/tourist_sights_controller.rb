class Api::V1::TouristSightsController < ApplicationController

  def index
    require 'pry'; binding.pry
    long_lat = CountryNameFacade.capital_long_lat(params[:country])
    
  end
end
