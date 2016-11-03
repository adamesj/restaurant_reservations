class OwnersController < ApplicationController
  before_action :authenticate_owner!, only: [:dashboard, :edit, :update, :destroy]

  def dashboard
    @restaurants = Restaurant.all
  end
end