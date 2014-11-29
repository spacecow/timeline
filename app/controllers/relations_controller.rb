class RelationRepository
  def new_relation params={}
    relation = Relation.new params
    RelationForm.new relation
  end
  def save_relation relation
    relation.save
  end
end

class RelationsController < ApplicationController
  include RelationRunners
  
  def show
  end

  def new
    init = {from_article_id:params[:from_article_id]}
    @form = repo.new_relation init
  end

  def create
    run(Create, relation_params) do |on|
      on.success {|form|
        redirect_to form.relation, created(:relation)
      }
      on.failure {|form|
        @form = form
        render :new
      }
    end
  end

  def repo
    @repo ||= RelationRepository.new
  end

  private

    def relation_params
      params.require(:relation).permit(:from_article_id, :to_article_id)
    end

end
