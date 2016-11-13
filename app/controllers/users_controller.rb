class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :edit, :update, :destroy]

  def dashboard
    @restaurants = Restaurant.all
  end

  def my_stars

  end

end