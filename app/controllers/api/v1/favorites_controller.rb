class Api::V1::FavoritesController < ApplicationController
  def create
    @user = User.find_by(api_key: params[:api_key])
    if !@user
      render json: {"error": "cannot find user with given api key"}, status: 400
    else
      @favorite = @user.favorites.new(favorite_params)
      render json: { "success": "Favorite added successfully" }, status: 201 if @favorite.save
    end
  end

  def index
    @user = User.find_by(api_key: params[:api_key])
    if !@user
      render json: {"error": "cannot find user with given api key"}, status: 400
    else
    render json: FavoriteSerializer.new(@user.favorites)
    end
  end

  def favorite_params
    params
    .require(:favorite)
    .permit(:country, :recipe_link, :recipe_title)
  end
end
