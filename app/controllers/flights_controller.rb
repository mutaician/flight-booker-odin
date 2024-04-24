class FlightsController < ApplicationController

  def index
    if params[:flight]
      @flights = Flight.where(departure_airport_id: params[:flight][:departure_airport_id],
                              arrival_airport_id: params[:flight][:arrival_airport_id],)
                              .where("DATE(start_datetime) = ?", params[:start_datetime])
    else
      @flights = Flight.all
    end

  end

end
