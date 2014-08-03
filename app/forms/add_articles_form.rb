class AddArticlesForm < TokenForm
  token_field :article_tokens

  def initialize event
    super id:event.id,
          tokens:event.article_ids.join(','),
          universe_ids:event.universe_article_ids
  end

  private

    def persist!
    end

end
