class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
   @article = Article.find(params[:article_id])
   #@comment = @article.comments.create(comment_params)
   @comment = Comment.new(comment_params)
   @comment.user_id = current_user.id
   @comment.article_id = @article.id
    if @comment.save
      redirect_to article_path(@article)
    else
      puts 'not done'
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
      params.require(:comment).permit(:id, :body, :created_at, :updated_at, :status, :article_id, :user_id)
    end
end
