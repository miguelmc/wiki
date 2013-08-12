class ArticlesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5).search(params)
  end
  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(params[:article])
    users = User.all
    if @article.save
      users.each do |u|
        UpdatesMailer.new_article(u, @article).deliver
      end
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
    users = User.all
    if @article.update_attributes(params[:article])
       users.each do |u|
         UpdatesMailer.article_updated(u, @article).deliver
       end
       redirect_to @article, flash: { notice: t("articles.edit.messages.success.saved")}
    else
      render 'edit'
    end
  end
  def show
    @article = Article.find(params[:id])
    @tags = @article.tags.pluck(:name)
    @commentable = @article
    @comments = @commentable.comments.includes(:user).paginate(page: params[:page], per_page: 5)
    @comment = Comment.new
    @last_log = @article.logs.first
    @logs = @article.logs @last_log
    @category = @article.category
  end

  def preview
    @article = current_user.articles.build(params[:article])
    respond_to do |format|
      format.js
    end
  end
end
