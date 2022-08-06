class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @articles = Article.includes(:user).where(articles: { user_id: params[:id] })
  end

  private

  def user_params
    # The create action can access with params[:article][:title]
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
