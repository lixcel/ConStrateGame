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

  def edit
  end
end
