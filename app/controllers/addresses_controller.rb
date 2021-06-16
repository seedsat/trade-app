class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_address, only: [:edit, :update]
  before_action :move_index, only: [:edit, :update]
  before_action :no_address_move_index, only: [:new, :create]
  before_action :address_exists_move_mypage, only: [:new, :create]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def find_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(
                                    :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number
                                    ).merge(
                                      user_id: current_user.id
                                      )
  end

  def move_index
    redirect_to root_path unless params[:user_id].to_i == @address.user.id
  end

  def no_address_move_index
    if @address.nil? && (params[:user_id].to_i != current_user.id)
      redirect_to root_path
    end
  end

  # 配送先を登録済みなら新しく登録は出来ない
  def address_exists_move_mypage
    @user = User.find(params[:user_id])
    if @user.address.present?
      redirect_to user_path(current_user)
    end
  end
end
