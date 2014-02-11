class UniversesController < ApplicationController
  def index
  end

  def show
    self.current_universe_id = params[:id]
    redirect_to universes_path
  end
end
