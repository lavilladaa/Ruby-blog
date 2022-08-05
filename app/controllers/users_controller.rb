class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])


  end

  # def index
  #   @user = User.find(params[:article_id])

  #   @article = @user.articles.create(user_params)
  # end

  private

  def user_params
    # The create action can access with params[:article][:title]
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end