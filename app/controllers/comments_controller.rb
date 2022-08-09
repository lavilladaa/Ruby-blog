class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
   @article = Article.find(params[:article_id])
   @comment = Comment.new(comment_params.merge(user_id: current_user.id, article_id: @article.id))
    if @comment.save
      redirect_to article_path(@article)
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: 303
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :status)
    end
end
