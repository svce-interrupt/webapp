module EventsHelper

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
