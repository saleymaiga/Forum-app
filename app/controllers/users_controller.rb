class UsersController < ApplicationController

  def new
  	@user = User.new
  end


  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Your account was created successfully"
  		session[:user_id] = @user.id
  		redirect_to user_path(@user)
  	else
  		flash[:alert] = "There was a problem creating your account"
  		redirect_to new_user_path
  	end
  end




  def edit
  end

  def show
  end

  def index
  end


  private

  def user_params
  	params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
  end
end
