class EventsController < ApplicationController
  def reg
  	if logged_in?
  		@e = Event.find_by(user_id: session[:user_id])
  		@e = Event.update(event_params)
  		if @e.save
  			flash[:success] = "successfully registered for the events"
  		else
  			flash[:error] = "Oops, not registered"
  		end
  	else
  		flash[:error] = "Please sign In before registering"
  		redirect_to root_path
  	end

  end

  def event_params
  	params.require(:events).permit(:e1,:e2,:e3,:e4,:e5,:e6,:e7,:e8,:e9)
  end
end
