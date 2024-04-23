class FlightsController < ApplicationController

  def index
    start_date = Date.today
    if params[:flight]
      start_date = Date.new(params[:flight]["start_datetime(1i)"].to_i,
                            params[:flight]["start_datetime(2i)"].to_i,
                            params[:flight]["start_datetime(3i)"].to_i)


      @flights = Flight.where(departure_airport_id: params[:flight][:departure_airport_id],
                              arrival_airport_id: params[:flight][:arrival_airport_id])
                              .where("DATE(start_datetime) = ?", start_date)
    else
      @flights = Flight.all
    end

    @start_date = start_date
  end

end
