class ArticlesController < ApplicationController
  def index
  end

  def show
    article = current_universe.articles.find params[:id]
    @add_events_form = AddEventsForm.new current_universe, article
  end

  def new
    @article_form = ArticleForm.new current_universe.id
  end

  def create
    universe = Universe.last
    @article_form = ArticleForm.new current_universe.id, params.require(:article)
    if @article_form.save
      redirect_to articles_path, flash:{notice:'Article created'}
    else
      render :new
    end
  end

  def update
    article = current_universe.articles.find params[:id]
    @add_events_form = AddEventsForm.new current_universe, article
    if @add_events_form.submit params.require(:article)
      redirect_to articles_path, flash:{notice:'Event(s) added'}
    else
      render :show
    end
  end
end
