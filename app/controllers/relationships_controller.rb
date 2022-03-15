class RelationshipsController < ApplicationController
  # フォローをする
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  # フォローを外す
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @user = user.followings
  end

  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @user = user.followers
  end

end