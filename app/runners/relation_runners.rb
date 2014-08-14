module RelationRunners
  class Create < Runner
    def run params
      @form = repo.new_relation params
      if repo.save_relation @form
        success @form
      else
        failure @form
      end
    end
  end
end
