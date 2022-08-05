class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  # def index
  # @article
  # end

  private

  def user_params
    # The create action can access with params[:article][:title]
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end