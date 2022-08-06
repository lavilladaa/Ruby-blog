class ArticlesController < ApplicationController
  def index
    @articles = Article.all

    #@user = User.find_by(params[:id])
    puts 'xxx'*50
    puts params[:id]
  end

  def show
    @article = Article.find(params[:id])

    @user = User.find_by(params[:user_id])
    puts 'sss'*50
    puts params[:user_id]
  end

  def new
    @article = Article.new
  end

  def create
    # if Article.public_count ==0
    #   @user = current_user
    # else
    #   @user = User.find_by(current_user.id)
    # end
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
    params.require(:article).permit(:title, :body, :status, :user_id)
  end
end
