class RelationsController < ApplicationController
  
  def show
  end

  def new
    relation = Relation.new(from_article_id:params[:from_article_id])
    @relation = RelationForm.new relation
  end

  def create
    relation = Relation.new relation_params
    relation.save
    redirect_to relation 
  end

  private

    def relation_params
      params.require(:relation_form).permit(:from_article_id)
    end

end
