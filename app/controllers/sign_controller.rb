class SignController < ApplicationController
  ##sign IN 
  #up-new,in-new are not required.
  def in_new
  	if session[:user_id] == nil
  		@user = User.new
  	else
  		flash[:error] = "Already Logged In"
  		#session[:return_to] ||= request.referer
  		#redirect_to session.delete(:return_to)
  		redirect_to root_path
  	end
  end

  def in_create
  	###in_new code to here.
  	if session[:user_id] != nil
  		flash[:error] = "Already Logged In"
  		#session[:return_to] ||= request.referer
  		#redirect_to session.delete(:return_to)
  		redirect_to root_path
  	else
  	
  	@user = User.find_by(email: params[:user][:email])
  	if(@user)#if user exists
  		if !!@user.authenticate(params[:user][:password])
  			session[:user_id] = @user.id
  			flash[:success] = "Successfully Signed In."
  			redirect_to root_path #go to where the user came from.
  		else
  			flash[:error] = "Invalid Credentials"
  			redirect_to root_path
  		end
  	else
  		flash[:error] = "Sign Up please..."
  		redirect_to root_path#sign_up_new_path
  	end

  end#first else
  end#def

  #sign UP
  def up_new
  	if session[:user_id] == nil
  		@user = User.new
  	else
  		flash[:error] = "Already Logged In"
  		#session[:return_to] ||= request.referer
  		#redirect_to session.delete(:return_to)
  		#redirect_to(request.env['HTTP_REFERER'])
  		#redirect_to(:back) 	
  		redirect_to root_path
  	end
  end
  
  def up_create
  	@user = User.find_by(email: sign_up_params[:email])
  	if !!@user
  		flash[:error] = "Email already exists"
  		redirect_to root_path
  	else
  		@user = User.new(sign_up_params)
  		if @user.save
        #Create Event Tuple for the new user.
        @user.event = Event.new(event_create_params)
        
  			flash[:success] = "Successfully Signed UP"
  			#directing user from sign up-success to index without sign in.
  			session[:user_id] = User.find_by(email: sign_up_params[:email]).id
  			redirect_to root_path#sign_up_confirm_path
  		else
  			flash[:error] = "Please fill form properly"
  			redirect_to root_path
  		end
  	end

  end

  def destroy
  	log_out if logged_in?
  	flash[:success] = "Signed Out"
  	redirect_to root_path
  end


  private
  
  def sign_up_params
  	params.require(:user).permit(:email,:password,:password_confirmation,:name,:phone,:college)
  end  	

  #not used
  def sign_in_params
  	params.require(:user).permit(:email,:password,:remember)
  end

  ### Helper Methods###
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end


	# Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
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

  # Forgets a persistent session.
  def forget(user)
    user.forget #forget in user model, updates remember_digest to nil.
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end


# Logs out the current user.
  def log_out
  	forget(current_user)	#forget(user) in helper.
    session.delete(:user_id)
    @current_user = nil
  end

  ##Initially false for all events
  def event_create_params
    {e1: 0,e2: 0,e3: 0,e4: 0,e5: 0,e6: 0,e7: 0,e8: 0,e9: 0}
  end


###
#end of controller
end

