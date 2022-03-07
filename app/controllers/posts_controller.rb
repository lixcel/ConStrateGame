class PostsController < ApplicationController
  def index
    @posts = Post.all
    @tags = Tag.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
