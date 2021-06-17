class LikesController < ApplicationController
  before_action :set_picture

  def create
    Like.create(user_id: current_user.id, picture_id: @picture.id)
  end

  def destroy
    Like.find_by(user_id: current_user.id, picture_id: @picture.id).destroy
  end

  private
  def set_picture
    @picture =  Picture.find(params[:picture_id])
  end
end
