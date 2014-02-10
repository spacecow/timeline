class ArticlesController < ApplicationController
  def index
  end

  def new
    @article_form = ArticleForm.new
  end

  def create
    @article_form = ArticleForm.new params.require(:article)
    if @article_form.save
      redirect_to articles_path, flash:{notice:'Article created'}
    else
      render :new
    end
  end
end
