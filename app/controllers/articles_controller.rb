class ArticlesController < ApplicationController
  def index
  end

  def new
    @article_form = ArticleForm.new current_universe_id
  end

  def create
    universe = Universe.last
    @article_form = ArticleForm.new current_universe_id, params.require(:article)
    if @article_form.save
      redirect_to articles_path, flash:{notice:'Article created'}
    else
      render :new
    end
  end
end
