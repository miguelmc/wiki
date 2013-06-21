class AuditsController < ApplicationController
  def show
    @audit = Article.find(params[:id]).logs.find(params[:article_id])
  end
end
