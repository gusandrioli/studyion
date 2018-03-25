class UsersController < ApplicationController
  def index
    # @users = User.paginate(page: params[:page], per_page: 5)
    if params[:search]
      @users = User.where('first_name LIKE ? OR last_name LIKE ? OR email LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").paginate(page: params[:page], per_page: 5)
    else
      @users = User.paginate(page: params[:page], per_page: 5)
    end
  end
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.paginate(page: params[:page], per_page: 5)
  end
end
