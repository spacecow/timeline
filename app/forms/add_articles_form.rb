class AddArticlesForm < TokenForm
  token_field :article_tokens
  attr_accessor :event 
  #TODO make this general in the token form

  def initialize event
    super id:event.id,
          tokens:event.article_ids.join(','),
          universe_ids:event.universe_article_ids
    self.event = event
  end

  private

    def persist!
    end

end
