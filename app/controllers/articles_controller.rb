class ArticlesController < ApplicationController
  before_action :find_article, only:[:show, :update, :destroy]

  def index
     @articles = Article.all
     render json: @articles 
  end

  def show
     @article = Article.find(params[:id])
     render json: @article
  end

  def create
    @article = Article.new(article_params) 
    if @article.save
      render json: @article
    else
      render error: {error: "unable to create"}
    end
  end
    
  def update
    if @article
       @article.update(article_params)
       render json: { message:"Article Successfully updated"}
    else
      render json: { message: "unable to update "}
    end
  end

  def destroy
    if @article
       @article.destroy
       render json: { message:"Article Successfully destroy"}
    else
      render json: { message: "unable to destroy"}
    end
  end

  private
  def article_params
     params.require(:article).permit(:title, :text)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
