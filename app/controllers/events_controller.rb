class Repository
  attr_accessor :universe

  def initialize universe
    self.universe = universe
  end

  def find_all_events
    universe.events
  end
  def new_event *attrs
    event = universe.events.build
    EventForm.new event, *attrs
  end
  def save_event event
    event.save
  end
end

class EventsController < ApplicationController
  include EventRunners

  def index
    @events = repo.find_all_events
    respond_to do |format|
      format.html
      format.json { render json:@events.where("title like ?", "%#{params[:q]}%") }
    end
  end

  def show
    event = current_universe.events.find params[:id]
    @add_articles_form = AddArticlesForm.new event
  end

  def new
    @event = repo.new_event
  end

  def create
    run(Create, event_params) do |on|
    end
  end

  def create_successful event
    redirect_to events_path, flash:{notice:'Event created'}
  end

  def create_failed event
    @event = event
    render :new
  end

  def edit
    event = current_universe.events.find params[:id]
    @event_form = EventForm.new event
  end

  def update
    event = current_universe.events.find params[:id]
    @event_form = EventForm.new event, params.require(:event)
    if @event_form.save
      redirect_to events_path, flash:{notice:'Event updated'}
    else
      render :edit
    end
  end

  def update_articles
    event = current_universe.events.find params[:id]
    @add_articles_form = AddArticlesForm.new event
    if @add_articles_form.submit params.require(:event)
      redirect_to events_path, flash:{notice:'Articles updated'}
    else
      render :show
    end
  end

  def duplicate
    event = current_universe.events.find params[:id]
    @event_form = EventForm.new event, {}, false
  end

  def repo
    @repo ||= Repository.new current_universe
  end

  private

    def event_params
      params.require(:event)
    end

end
