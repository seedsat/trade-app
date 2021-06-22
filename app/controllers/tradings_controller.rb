class TradingsController < ApplicationController

  def create
    trade = Trading.new(user_id: params[:user_id], picture_id: params[:picture_id])
    @request_user = User.find(current_user.id)
    @applicant_user = User.find(params[:user_id])
    if trade.save
      TradeMailer.with(request_user: @request_user, applicant_user: @applicant_user).request_email.deliver
      TradeMailer.with(applicant_user: @applicant_user, request_user: @request_user).applicant_email.deliver
      redirect_to picture_path(params[:picture_id])
      flash[:notice] = "トレードが成立しました！"
    end
  end
end
