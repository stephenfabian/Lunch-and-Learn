class Api::V1::TouristSightsController < ApplicationController
  def index
    if CountryNameFacade.valid_country?(params[:country])
      country = params[:country]
    else
      country = CountryNameFacade.random_country
    end
    long_lat = CountryNameFacade.capital_long_lat(country) 
    @tourist_sights = PlaceFacade.create_tourist_sights_obj(long_lat.first, long_lat.second)
    render json: TouristSightSerializer.new(@tourist_sights)
  end
end
