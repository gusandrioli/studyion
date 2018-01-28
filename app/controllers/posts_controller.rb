class PostsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end
  def show
  end
  def edit
  end
  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
  def destroy
    if @post.destroy
      redirect_to posts_path
    end
  end

  private
    def set_user
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title, :body)
    end
    def require_same_user
      if current_user != @post.user 
        redirect_to posts_path
      end
    end
end
