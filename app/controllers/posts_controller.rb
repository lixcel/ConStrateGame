class PostsController < ApplicationController
  def index
    @posts = Post.all
    @tags = Tag.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id, :tag_id, :kind)
  end
end
