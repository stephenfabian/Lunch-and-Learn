class Api::V1::UsersController < ApplicationController

  def create
    # if User.find_by(email: params[:email])
    if User.find_by(email: params[:user][:email])
      render json: {error: "email must be unique"}, status: 400 
    else
      # random_key = User.generate_random_key
      # @user = User.new(name: params[:name], email: params[:email], api_key: random_key)
      @user = User.new(user_params)
      render json: UserSerializer.new(@user), status: 201 if @user.save
    end
  end

  def user_params
    params
    .require(:user)
    .permit(:name, :email)
    .with_defaults(api_key: User.generate_random_key)
  end
end
