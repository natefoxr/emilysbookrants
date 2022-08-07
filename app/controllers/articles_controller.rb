class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description, :short_description, :tag))
        if @article.save
            flash[:notice] = "Blog was created successfully"
            redirect_to @article
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @article.update(params.require(:article).permit(:title, :description, :short_description, :tag))
            flash[:notice] = "Blog was updated successfully"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path, status: :see_other
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end
  
end