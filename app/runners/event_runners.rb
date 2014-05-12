require_dependency './app/runners/runner'

module EventRunners
  class Create < Runner
    def run event_params
      event = repo.new_event event_params 
      if repo.save_event event
        success event
      else
        failure event
      end
    end
  end
end
