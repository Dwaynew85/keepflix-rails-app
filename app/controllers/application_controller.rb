class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception #added myself

    def authentication_required
        if !logged_in?
            redirect_to login_path
        end
    end

    def logged_in?
        !!current_user
    end

    def confirm_user
        if params[:id] != current_user.id
            redirect_to user_path(current_user), notice: 'You are not authorized to do that'
        end
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user, :logged_in?, :check_for_user
end
