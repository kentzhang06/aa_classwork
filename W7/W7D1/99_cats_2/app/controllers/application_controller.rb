class ApplicationController < ActionController::Base
    
    def current_user

    end

    def require_logged_in

    end

    def require_logged_out

    end

    def login(user)
      session[:session_token] = user.reset_session_token!
    end

    def logged_in?

    end

    def logout

    end
end
