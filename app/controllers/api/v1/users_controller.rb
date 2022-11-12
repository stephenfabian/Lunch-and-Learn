class Api::V1::UsersController < ApplicationController

  def show

  end

  def create
    require 'pry'; binding.pry
    params[:user]
  end
end
