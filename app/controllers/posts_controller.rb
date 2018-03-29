class PostsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_user
  def index
    # @posts = Post.search(params).paginate(page: params[:page], per_page: 5)
    if params[:search]
      @posts = Post.where('title LIKE ?', "%#{params[:search]}%").paginate(page: params[:page], per_page: 5)
    else
      @posts = Post.paginate(page: params[:page], per_page: 5)
    end
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "Note was successfully created"
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
      flash[:success] = "Note was successfully updated"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
  def destroy
    if @post.destroy
      flash[:danger] = "Note was destroyed"
      redirect_to posts_path
    end
  end

  private
    def set_user
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title, :body, :file, subject_ids: [])
    end
    def require_same_user
      if current_user != @post.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own article"
        redirect_to posts_path
      end
    end
end
