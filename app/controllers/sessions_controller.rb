class SessionsController < ApplicationController
    def new
    end

    def create 
        if auth_hash = request.env["omniauth.auth"]
            user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = user.id

            redirect_to root_path 
        else
        user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id

                redirect_to user_path(user), notice: "Welcome #{user.name}!" 
            else 
                flash.new[:alert] = "Email, Name, or Password is invalid"
                render 'new' #'sessions/new'
            end
        end
    end

    def destroy
        reset_session
        redirect_to login_path, notice: "Logged out!"
    end
end
