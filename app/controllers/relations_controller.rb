class RelationsController < ApplicationController
  
  def new
    relation = Relation.new
    @relation_form = RelationForm.new relation
  end

end
