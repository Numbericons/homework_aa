class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:session_token] = @user.session_token
            flash[:success] = "Welcome to ZMusic"
            redirect_to user_url(@user.id)
        else
            render :new, status: 422
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render :show
        else
            flash[:errors] = "Invalid user path"
            redirect_to users_url
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end