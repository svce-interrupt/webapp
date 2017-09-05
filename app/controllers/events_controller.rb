class EventsController < ApplicationController
  def reg
  	if logged_in?
  		@user = User.find_by(id: session[:user_id])
  		#Update events to DB.
  		if @user.event.update(event_params)
  			flash[:success] = "successfully registered for the events"
  			redirect_to root_path
  		else
  			flash[:error] = "Oops, not registered"
  			redirect_to root_path
  		end
  	else
  		flash[:error] = "Please sign In before registering"
  		redirect_to root_path
  	end

  end

  def event_params
  	params.require(:event).permit(:e1,:e2,:e3,:e4,:e5,:e6,:e7,:e8,:e9)
  end




  ##Helper methods
  # Returns true if the user is logged in, false otherwise.
  	def logged_in?
    !current_user.nil?
  	end

  	# Returns the user corresponding to the remember token cookie.
  	def current_user
    if (user_id = session[:user_id])	#assign session-user if current_user is nil.
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])	#else assign it to cookie user.
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  	end
end
