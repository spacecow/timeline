class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_universe?

  def run(klass, *args, &block)
    klass.new(self, &block).run(*args)
  end

  def current_universe_id=(id)
    session[:current_universe_id] = id
  end

  def current_universe?
    !session[:current_universe_id].nil?
  end

  def current_universe
    @current_universe ||= Universe.find session[:current_universe_id]
  end

  def created mdl
    {notice:"#{mdl.capitalize} created"}
  end
end
