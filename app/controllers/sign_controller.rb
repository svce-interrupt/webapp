class SignController < ApplicationController
  def up_new
  	if session[:user_id] == nil
  		@user = User.new
  	else
  		#session[:return_to] ||= request.referer
  		#redirect_to session.delete(:return_to)
  		#redirect_to(request.env['HTTP_REFERER'])
  		#redirect_to(:back) 	
  		redirect_to "/500.html"
  	end
  end

  def up_create
  	@user = User.find_by(email: sign_up_params[:email])
  	if !!@user
  		flash[:error] = "Email already exists"
  		redirect_to sign_in_new_path
  	else
  		@user = User.new(sign_up_params)
  		if @user.save
  			flash[:success] = "Confirmation link is sent to your mail"
  			redirect_to sign_up_confirm_path
  		else
  			flash[:error] = "Please fill form properly"
  			render :up_new
  		end

  	end

  end

  def in_new
  	if session[:user_id] == nil
  		@user = User.new
  	else
  		#session[:return_to] ||= request.referer
  		#redirect_to session.delete(:return_to)
  		redirect_to "/500.html"
  	end
  end

  def in_create
  	@user = User.find_by(email: params[:email])
  	if(@user)#if user exists
  		if !!@user.authenticate(params[:password])
  			session[:user_id] = @user.id
  			flash[:success] = "Successfully Signed In."
  			redirect_to "/index.html" #go to where the user came from.
  		else
  			flash.now[:error] = "Invalid Credentials"
  			render :in_new
  		end
  	else
  		flash[:error] = "Sign Up please..."
  		redirect_to sign_up_new_path
  	end

  end

  def out
  	session[:user_id]=nil
  	redirect_to sign_in_new_path
  end


  private
  def log_in_password_params
  	params.require(:user).permit(:password)
  end
  def sign_up_params
  	params.require(:user).permit(:email,:password,:password_confirmation)
  end  
  

end

