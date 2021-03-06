class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def is_authenticated?
    if !logged_in?
      flash[:my_message] = 'You must be logged in to view this content'
      redirect_to login_path
    end
  end

  def check_if_logged_in
    redirect_to "/" unless session[:user_id]
  end

end
