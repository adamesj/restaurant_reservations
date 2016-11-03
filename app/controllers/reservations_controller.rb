class ReservationsController < ApplicationController
  prepend_before_action :check_captcha, only: [:create]

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.create(reservation_params)
    if @reservation.save
      ReservationNotifier.reservation_notifier(@reservation).deliver
      verify_recaptcha(model: @reservation) && @reservation.save
    else
      render :action => 'new'
    end
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