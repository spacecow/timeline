class EventsController < ApplicationController
  def index
  end

  def new
    @event_form = EventForm.new current_universe_id
  end

  def create
    @event_form = EventForm.new current_universe_id, params.require(:event)
    if @event_form.save
      redirect_to events_path, flash:{notice:'Event created'}
    else
      render :new
    end
  end
end
