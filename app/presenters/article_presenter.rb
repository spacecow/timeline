class ArticlePresenter < BasePresenter
  presents :article

  def name; article.name end
end
