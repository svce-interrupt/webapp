class MainController < ApplicationController
  def index
  	@reg = Register.new
  end

  def register
    @reg = Register.new(register_params)
    if @reg.save
      flash[:success] = "successfully Registered"
      redirect_to root_path
    else
      flash.now[:error] = "Sorry, Registration failed, Please fill the form properly! or The email is already taken"
      render :index
    end
  end

  private
  def register_params
    params.require(:register).permit(:first_name, :last_name, :email, :phone, :password, :college_name, :e1, :e2, :e3, :e4, :e5, :e6, :e7, :e8, :e9)
  end

end
