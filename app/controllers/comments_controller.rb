class CommentsController < ApplicationController
  before_filter :load_commentable
  before_filter :authenticate_user!

  def new
    @comment = current_user.comments.new
  end
  def create
    @comment = current_user.comments.create(commentable: @commentable, content: params[:comment][:content] )
    if @comment.save
      respond_to do |format|
        format.html {  redirect_to @commentable, notice: "Comment created." }
        format.js
      end
    else
      render :new
    end
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
