class TradingsController < ApplicationController

  def create
    trade = Trading.new(user_id: params[:user_id], picture_id: params[:picture_id])
    if trade.save
      redirect_to picture_path(params[:picture_id])
    end
  end
end
