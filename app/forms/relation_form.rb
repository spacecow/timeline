class RelationForm
  include ActiveModel::Model
  attr_accessor :relation

  def initialize relation
    self.relation = relation
  end

  def id; relation.id end
  def persisted?; false end

end
