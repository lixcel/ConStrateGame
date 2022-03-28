class UsersController < ApplicationController

  before_action :set_user, only: [:likes,:bookmarks,:posts]

  def show
    @user = User.find(params[:id])
    @post = @user.posts.all.order(created_at: :desc).limit(3)
    @favorite = Favorite.where(user_id: @user.id).order(created_at: :desc).limit(3)
    @bookmark = Bookmark.where(user_id: @user.id).order(created_at: :desc).limit(3)
  end

  def likes
    @favorite = Favorite.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(10)
    @tag_list = Tag.all
  end

  def bookmarks
    @bookmark = Bookmark.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(10)
    @tag_list = Tag.all
  end

  def posts
    @posts = Post.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(10)
    @tag_list = Tag.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :image, :introduction)
  end

end
