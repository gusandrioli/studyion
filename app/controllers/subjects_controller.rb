class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show]
  def index
    @subjects = Subject.paginate(page: params[:page], per_page: 5)
  end
  def new
    @subject = Subject.new
  end
  def create
    @subject = Subject.new(subject_params) 
    if @subject.save
      redirect_to subject_path(@subject)
    else
      render 'new'
    end
  end
  def show
  end
  def edit
  end
  def update
    if @subject.update(subject_params)
      redirect_to subject_path(@subject)
    else
      render 'edit'
    end
  end
  def destroy
    if @subject.destroy
      redirect_to subjects_path
    end
  end

  private
    def subject_params
      params.require(:subject).permit(:name)
    end
    def set_subject
      @subject = Subject.find(params[:id])
    end
    def require_admin
      if !current_user.admin?
        redirect_to subjects_path
      end
    end
end
