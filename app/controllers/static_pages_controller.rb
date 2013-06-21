class StaticPagesController < ApplicationController
	def home
    @articles = Article.limit(7)
	end
end
