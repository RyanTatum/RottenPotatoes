class SessionsController < ApplicationController
    
    def session_params
        params.require(:user).permit(:user_id, :email, :session_token)
    end
  
    def new
        # default, display new.html
    end
    
    def create
        user = User.find_by_user_id(session_params[:user_id])

        if !user || user.email != session_params[:email]
            flash[:notice] = "Invalid User-ID/E-Mail combination"
            redirect_to login_path
        else
            session[:session_token] = user.session_token
            redirect_to movies_path
        end
    end
    
    def destroy
        reset_session
        redirect_to movies_path
    end
end