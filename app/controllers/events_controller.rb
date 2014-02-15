class EventsController < ApplicationController
  def index
    @events = current_universe.events
  end

  def show
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

  def duplicate
    event = current_universe.events.find params[:id]
    @event_form = EventForm.new event, {}, false
  end
end
