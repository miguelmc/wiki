class AuditsController < ApplicationController
  def show
    @audit = Article.find(params[:article_id]).logs.find(params[:id])
  end
end
