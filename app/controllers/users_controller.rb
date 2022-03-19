class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = @user.posts.all.order(created_at: :desc).page(params[:page]).per(3)
    @favorite = Favorite.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(3)
  end

  def index
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :image, :introduction)
  end

end
