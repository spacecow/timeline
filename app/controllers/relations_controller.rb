class RelationsController < ApplicationController
  
  def show
  end

  def new
    relation = Relation.new
    @relation_form = RelationForm.new relation
  end

  def create
    relation = Relation.new
    relation.save
    redirect_to relation 
  end

end
