class ArticlesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all
    end
  end
  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
      redirect_to @article, flash: { notice: t("articles.new.messages.success.saved")}
    else
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
       redirect_to @article, flash: { notice: t("articles.edit.messages.success.saved")}
    else
      render 'edit'
    end
  end
  def show
    @article = Article.find(params[:id])
    @tags = @article.tags.pluck(:name)
    @commentable = @article
    @comments = @commentable.comments.includes(:user)
    @comment = Comment.new
    @logs = @article.audits.where("user_id IS NOT NULL").includes(:user) #'where' to make test pass 

  end
end
