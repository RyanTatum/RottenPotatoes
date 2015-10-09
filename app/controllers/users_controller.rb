class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
  end
  
  def new
    # default: render 'new' template
  end

  def create
    if (User.find_by_user_id user_params[:user_id])
       flash[:notice] = "Sorry, this user-id is taken. Try again." 
       redirect_to new_user_path
    else
        flash[:notice] = "Welcome #{user_params[:user_id]}. Your account has been created"
        @user = User.create_user!(user_params)
        redirect_to login_path
    end
  end
end