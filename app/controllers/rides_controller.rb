class RidesController < ApplicationController

  def create
    @attraction = Attraction.find(params[:id])
    @ride = Ride.create(user_id: session[:user_id], attraction_id: @attraction.id)
    
    flash[:ride_message] = @ride.take_ride
    redirect_to user_path(current_user)
  end


end
