class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.where(email: params[:email]).first
  	if @user && @user.password == params[:password]
  		session[:user_id] = @user.id
  		flash[:notice] = "Welcome #{@user.fname}"
  		redirect_to user_path(@user)
  	else
  		flash[:alert] = "There was a problem signing you in"
  		redirect_to new_user_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "You've been looged out successfully"
  	redirect_to root_path
  	
  end
end
