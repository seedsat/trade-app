class PicturesController < ApplicationController
  
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

  private

  def picture_params
    params.require(:picture).permit(:name, :info, :member_name, :group_id, :status_id, :position_id, images: []).merge(user_id: current_user.id)
  end
end
