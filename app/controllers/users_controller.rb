class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  before_action :move_index, only: [:show]

  def show
    @pictures = @user.pictures.sort.reverse
  end

  def like
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def move_index
      redirect_to root_path unless @user.present? && @user.id == current_user.id
  end
end
