class SessionsController < ApplicationController
    def new
    end

    def create
        if auth
            user = User.find_or_create_by(id: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.pic_url = auth['info']['image']
                u.password = SecureRandom.hex
                byebug
                u.save
            end
            session[:user_id] = user.id

            redirect_to root_path 
        else
        user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id

                redirect_to root_path
            else 
                flash.now[:alert] = "Email, Name, or Password is invalid"
                render 'new' #'sessions/new'
            end
        end
    end

    def destroy
        reset_session
        redirect_to login_path, notice: "Logged out!"
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end
end
