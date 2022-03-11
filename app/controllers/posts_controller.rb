class PostsController < ApplicationController

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end

  def index
    @posts = Post.page(params[:page]).per(10)
    @tag_list = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # [,]で区切って配列にする記述
    tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to post_path(@post),notice: '投稿完了！'
    else
      render:new
    end
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:name].split(',')
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id),notice: '投稿完了！'
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :kind)
  end
end
