class PostsController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      render 'index'
    else
      render 'new'
    end
  end
  def show
  end

  private
    def set_user
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
