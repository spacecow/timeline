class ArticlePresenter < BasePresenter
  presents :article

  def actions
    h.content_tag :ul, class: :actions do
      h.content_tag :li, class: :action do
        h.link_to "Add Relation", h.new_relation_path(from:article.id)
      end
    end
  end

end
