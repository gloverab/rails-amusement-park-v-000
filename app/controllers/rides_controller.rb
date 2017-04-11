class RidesController < ApplicationController

  def new
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])

    flash[:notice] = @ride.take_ride
    redirect_to current_user
  end

end
