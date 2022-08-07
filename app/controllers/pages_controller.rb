class PagesController < ApplicationController
    before_action :set_article, only: [:show]

    def home
      @articles = Article.all
    end

    def about
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end

end