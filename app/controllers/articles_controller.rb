class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to articles_path, flash:{notice:'Article created'}
    else
      render :new
    end
  end

  def article_params
    params.require(:article).permit(:name)
  end
end
