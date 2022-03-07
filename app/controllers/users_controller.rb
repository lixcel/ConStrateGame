class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :image, :introduction)
  end

end
