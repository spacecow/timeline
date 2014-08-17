class RelationPresenter < BasePresenter
  presents :relation

  def from_article_name
    relation.from_article_name
  end

end
