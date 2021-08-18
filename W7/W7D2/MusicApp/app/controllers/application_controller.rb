class ApplicationController < ActionController::Base
  skip_forgery_protection

  helper_method :current_user, :logged_in?

  #CR(R)LLL

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  # def require_logged_in
  #   redirect_to user_url(current_user) unless logged_in?
  # end

  # def require_logged_out
  #   redirect_to new_session_url if logged_in?
  # end

  def logged_in? #true or false
    !!current_user # not not true or not not false
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_user = nil
  end
end
