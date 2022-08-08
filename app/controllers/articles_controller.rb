class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @users = User.all
  end

  def show
    @user = User.find_by(params[:article_id])
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    # The create action can access with params[:article][:title]
    params.require(:article).permit(:title, :body, :status, :user_id)
  end
end
