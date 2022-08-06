class UsersController < ApplicationController
  def show
    if current_user.id == params[:user_id]
      @user = User.find_by(params[:user_id])
    else
      @user = User.find(params[:id])
    end

    @articles = Article.includes(:user).where(articles: { user_id: params[:id] })
  end

  private

  def user_params
    # The create action can access with params[:article][:title]
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
