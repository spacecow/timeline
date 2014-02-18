class AddArticlesForm
  include ActiveModel::Model

  attr_accessor :event, :tokens
  alias_method :article_tokens, :tokens

  validate :articles_belong_to_same_universe

  def initialize event
    self.event = event
    self.tokens = event.article_ids.join(',') 
  end

  def id; event.id end
  def persisted?; true end

  def submit params
    self.tokens = params[:article_tokens]
    if valid?
      true
    else
      false
    end
  end

  private

    def unique_ids; tokens.split('.').map(&:to_i).uniq end

    def articles_belong_to_same_universe
      errors.add(:article_tokens, "wrong universe") unless (unique_ids - universe_ids).empty?
    end

    def universe; event.universe end
    def universe_articles; universe.articles end
    def universe_ids; universe_articles.map(&:id) end

end
