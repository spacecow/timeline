require_dependency './app/runners/runner'

module EventRunners
  class Create < Runner
    def run event_attrs
      event = repo.new_event event_attrs
      if repo.save_event event
        context.create_successful event
      else
        context.create_failed event
      end
    end
  end
end
