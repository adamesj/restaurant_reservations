class ReservationsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservation.create(reservation_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.find(params[:id])
    @reservation.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private
    def reservation_params
      params.require(:reservation).permit(:email, :message, :reserved_at)
    end
end