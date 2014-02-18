class AddArticlesForm
  include ActiveModel::Model

  attr_accessor :article_tokens

  def initialize event
    self.article_tokens = "1"
  end

  def id; 666 end
  def persisted?; true end
end
