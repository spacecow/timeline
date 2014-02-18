class EventsController < ApplicationController
  def index
    @events = current_universe.events
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
    event = current_universe.events.build 
    @event_form = EventForm.new event
  end

  def create
    event = current_universe.events.build
    @event_form = EventForm.new event, params.require(:event)
    if @event_form.save
      redirect_to events_path, flash:{notice:'Event created'}
    else
      render :new
    end
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
end
