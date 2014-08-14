class RelationForm < BaseForm
  forms :relation
  attr_accessor :from_article_id

  def initialize relation
    super relation
    self.from_article_id = relation.from_article_id
  end

  #def id; relation.id end
  #def persisted?; false end

end
