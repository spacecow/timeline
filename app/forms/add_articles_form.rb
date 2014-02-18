class AddArticlesForm
  include ActiveModel::Model

  attr_accessor :tokens, :universe_ids
  alias_method :article_tokens, :tokens

  validate :articles_belong_to_same_universe

  def initialize(ids:[], out_of:[])
    self.tokens = ids.join(',') 
    self.universe_ids = out_of 
  end

  def id; 666 end
  def persisted?; true end

  private

    def unique_ids; tokens.split('.').map(&:to_i).uniq end

    def articles_belong_to_same_universe
      errors.add(:article_tokens, "wrong universe") unless (unique_ids - universe_ids).empty?
    end

end
