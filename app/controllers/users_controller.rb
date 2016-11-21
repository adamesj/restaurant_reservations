class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :edit, :update, :destroy]

  def dashboard
    @restaurants = current_user.restaurants
    @user = current_user
  end

  def my_stars

  end

  private
    def user_params
      params.require(:user).permit(:username, :email)
    end
end