class HomesController < ApplicationController
  def top
    @tag_list = Tag.all
    @posts = Post.order(created_at: :desc).limit(2)
  end
  
end
