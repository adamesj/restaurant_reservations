class ReservationNotifier < ActionMailer::Base
  include SendGrid

  default :from => 'jimmy.adames@example.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def reservation_notifier(reservation)
    @reservation = reservation
    mail( :to => @reservation.email,
    :subject => 'Your reservation has been confirmed. We can\'t wait to dine with you!' )
  end
end
