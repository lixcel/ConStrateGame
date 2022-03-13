class SearchesController < ApplicationController

  def search
    @range = params[:range]
    @tag_list = Tag.all
    if @range == "User"
      @users = User.looks(params[:search], params[:word]).page(params[:page]).per(10)
    else
      @posts = Post.latest.looks(params[:search], params[:word]).page(params[:page]).per(10)
    end
  end

end
