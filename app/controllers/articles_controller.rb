class ArticlesController < ApplicationController
    before_action :set_article, only: [:update, :show, :destroy, :edit] 

    def new
       @article = Article.new 
    end

    def index
        @article = Article.all
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "Article was Successfully created."
            redirect_to article_path(@article)
        else
            render 'new'
       
        end
    end
    def update
       
        if @article.update(article_params)
            flash[:success] = "Article was Successfully updated."
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end 

    def show
       
    end

    def edit
        
    end

    def destroy 
       
        @article.destroy

        flash[:danger] = "Article was successfuly deleted"
        redirect_to articles_path

    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

        def article_params
            params.require(:article).permit(:title, :description)
        end
    end
