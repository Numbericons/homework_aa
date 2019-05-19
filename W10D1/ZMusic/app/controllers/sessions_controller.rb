class SessionsController < ApplicationController
    def new
       render :new 
    end
    
    def create
        user = User.find_by_credentials(params[:email], params[:password])
        if user
            session[:session_token] = user.session_token
            flash[:success] = "Successfully logged in!"
            login!(user)
            redirect_to user_url(user.id)
        else 
            flash[:error] = "Bad credentials. You naughty person or thing"
            render new, status: 401
        end
    end

    def destroy
          current_user.reset_session_token!
        session[:session_token] = nil

        redirect_to new_session_url

    end
    def login!(user)
        @current_user = user
        session[:session_token] = user.session_token
    end

end