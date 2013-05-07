class ArticlesController < ApplicationController

  before_filter :authenticate_user!
  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
      redirect_to root_url, flash: { notice: t("articles.new.messages.success.saved")}
    else
      render "new"
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:user])
      redirect_to root_url, flash: { notice: t("articles.edit.messages.success.saved")}
    else
      render 'edit'
    end
  end
end
