class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :find_picture, only: [:edit, :update, :destroy, :show]
  before_action :move_index, only: [:edit, :update, :destroy]
  before_action :search_pictures, only: [:index, :show, :search]

  def index
    @pictures = Picture.includes(:user).order('created_at desc')
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @picture.destroy
  end

  def show
    @comment = Comment.new
    @comments = @picture.comments.includes(:user)
  end

  def search
    @results = @p.result.includes(:user).order('created_at desc')
  end

  private

  def picture_params
    params.require(:picture).permit(:name, :info, :member_name, :group_id, :status_id, :position_id, images: []).merge(user_id: current_user.id)
  end

  def find_picture
    @picture = Picture.find(params[:id])
  end

  def move_index
    redirect_to root_path unless @picture.user.id == current_user.id
  end

  def search_pictures
    @p = Picture.ransack(params[:q])
  end
end
