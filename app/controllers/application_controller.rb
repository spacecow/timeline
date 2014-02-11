class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_universe_id=(id)
    session[:current_universe_id] = id
  end

  def current_universe_id
    @current_universe_id ||= session[:current_universe_id] 
  end
end
