class Relation < ActiveRecord::Base
  belongs_to :from_article, class_name:'Article'

  def from_article_name
    from_article.name
  end
end
