class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :require_login

    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    private
    def require_login
        unless session[:user_id]
            redirect_to root_path
        end
    end
end
