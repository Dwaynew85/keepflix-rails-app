class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception #added myself

    def authentication_required
        if logged_in?
            redirect_to login _path
        end
    end

    def logged_in?
        session[:user_id]
    end

    def current_user
        @current_user ||= User.find(session[:user_id])
    end
end
