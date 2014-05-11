require_dependency './app/runners/runner'

class CreateRunner < Runner
  def run event_attrs
    event = repo.new_event event_attrs 
    if repo.save_event event
      context.create_successful 'Event created'
    else
      context.create_failed event
    end
  end
end
