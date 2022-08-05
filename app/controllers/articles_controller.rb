class ArticlesController < ApplicationController
  # To use the authentication system
  http_basic_authenticate_with name: 'dhh', password: 'secret', except: [:index, :show]

  def index
    @articles = Article.all

    @user = User.find_by(params[:user_id])
  end

  def show
    @article = Article.find(params[:id])
    #@user = User.find(params[:id])
    @user = User.find_by(params[:user_id])
  end

  def new
    @article = Article.new
  end

  def create
    #@article = Article.new(article_params)

    @user = User.find(current_user.id)

    @article = @user.articles.create(article_params)


    if @article.save
      # If the article is saved successfully
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
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
    params.require(:article).permit(:title, :body, :status)
  end
end
