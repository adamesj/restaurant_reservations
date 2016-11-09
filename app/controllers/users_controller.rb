class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :edit, :update, :destroy]

  def dashboard

  end
end