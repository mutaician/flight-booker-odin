class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    passengers = params[:passengers].to_i
    passengers.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.build(booking_params)
    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger, booking: @booking).ticket_email.deliver_now
      end
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
