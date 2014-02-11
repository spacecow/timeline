class UniversesController < ApplicationController
  def index
    @universes = Universe.all
  end

  def show
    self.current_universe_id = params[:id]
    redirect_to universes_path
  end
end
