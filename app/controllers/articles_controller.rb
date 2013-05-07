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
end