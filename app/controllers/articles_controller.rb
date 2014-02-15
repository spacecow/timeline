class ArticlesController < ApplicationController
  def index
  end

  def show
    article = current_universe.articles.find params[:id]
    @add_events_form = AddEventsForm.new article
  end

  def new
    article = current_universe.articles.build 
    @article_form = ArticleForm.new article
  end

  def create
    article = current_universe.articles.build
    @article_form = ArticleForm.new article, params.require(:article)
    if @article_form.save
      redirect_to articles_path, flash:{notice:'Article created'}
    else
      render :new
    end
  end

  def update
    article = current_universe.articles.find params[:id]
    @add_events_form = AddEventsForm.new article
    if @add_events_form.submit params.require(:article)
      redirect_to articles_path, flash:{notice:'Event(s) added'}
    else
      render :show
    end
  end
end
