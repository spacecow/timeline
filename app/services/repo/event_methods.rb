module Repo
  module EventMethods
    def find_all_events
      universe.events
    end

    def new_event *params
      event = universe.events.build
      EventForm.new event, *params
    end

    def save_event event
      event.save
    end
  end
end
