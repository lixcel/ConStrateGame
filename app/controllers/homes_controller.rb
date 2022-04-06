class HomesController < ApplicationController
  def top
    @tag_list = Tag.all
    @posts = Post.order(created_at: :desc).limit(3)
    @posts_favorite = Post.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end
  
  def about
  end

end
