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
  
  def show
  end

  def new
    init = {from_article_id:params[:from_article_id]}
    @relation = repo.new_relation init
  end

  def create
    @relation = repo.new_relation relation_params
    if repo.save_relation @relation
      redirect_to @relation.relation, created(:relation)
    else
      render :new
    end
  end

  private

    def relation_params
      params.require(:relation_form).permit(:from_article_id)
    end

    def repo
      @repo ||= RelationRepository.new
    end

end
