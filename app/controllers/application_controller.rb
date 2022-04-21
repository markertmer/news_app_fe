class ApplicationController < ActionController::Base
  helper_method :current_user, :require_user, :logged_in?

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def require_user
    if !current_user
      flash[:alert] = 'you must be logged in'
      redirect_to '/'
    end
  end
end
