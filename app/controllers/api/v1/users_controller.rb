class Api::V1::UsersController < ApplicationController

  def create
    if User.find_by(email: params[:email])
      render json: {error: "email must be unique"}, status: 400 
    else
    random_key = User.generate_random_key
    @user = User.new(name: params[:name], email: params[:email], api_key: random_key)
    render json: UserSerializer.new(@user), status: 201 if @user.save
    end
  end
end
