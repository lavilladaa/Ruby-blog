class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: "...", body: "...")

    if @article.save
      redirect_to @article # if the article is saved successfully
    else
      render :new, status: :unprocessable_entity # redisplays the form
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body) # the create action can access with params[:article][:title]
  end
end
