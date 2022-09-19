class CommentsController < ApplicationController
  def index
  	 @article = Article.find(params[:article_id])
     @comments = @article.comments.all 
     render json: @comments  
  end
  

  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    render json: @comment  
  end
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    render json: @comment
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id]).update(comment_params)
    render json: @comment
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id]).destroy
    render json: @comment
  end

  private
  def comment_params
     params.require(:comment).permit(:commenter)
  end
end



