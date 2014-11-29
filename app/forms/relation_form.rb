class RelationForm < BaseForm
  forms :relation
  attr_accessor :from_article_id, :to_article_id

  validates :from_article_id, presence:true
  validates :to_article_id, presence:true

  def initialize relation
    super relation
    self.from_article_id = relation.from_article_id
    self.to_article_id = relation.to_article_id
  end

  def save
    if valid? 
      persist!
      true
    else
      false
    end
  end

  def from_article
    @from_article ||= Article.find(from_article_id)
  end

  #def id; relation.id end
  #def persisted?; false end

  private

    def persist!
      relation.update from_article_id:from_article_id
    end

end
