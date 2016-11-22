class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def favorite
    @restaurant = Restaurant.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @restaurant
      redirect_to :back, notice: "You favorited #{@restaurant.name}"

    elsif type == "unfavorite"
      current_user.favorites.delete(@restaurant)
      redirect_to :back, notice: "Unfavorited #{@restaurant.name}"

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  def index
    @restaurants = Restaurant.all
    @hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      restaurant_path = view_context.link_to restaurant.name, restaurant_path(restaurant)
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
      marker.infowindow "<b>#{restaurant_path}</b>"
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.includes(:categories).find(params[:id])
    @restaurant.favorited_by
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_url
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :image, :latitude, :longitude, :created_at, :category_ids => [])
    end
end