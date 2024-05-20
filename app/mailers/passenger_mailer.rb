class PassengerMailer < ApplicationMailer
  default from: "notifications@example.com"

  def ticket_email
    @passenger = params[:passenger]
    @booking = params[:booking] 
    @url  = "http://example.com/login"
    mail(to: @passenger.email, subject: "Thank you for booking with us!")
  end

end
