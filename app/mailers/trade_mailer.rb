class TradeMailer < ApplicationMailer
  before_action :send_user

  def request_email
    @prefecture = Prefecture.find(@applicant_user.address.prefecture_id)
    mail(to: @request_user.email, subject: 'トレードが成立しました')
  end

  def applicant_email
    @prefecture = Prefecture.find(@request_user.address.prefecture_id)
    mail(to: @applicant_user.email, subject: 'トレードが成立しました')
  end

  private

  def send_user
    @request_user = params[:request_user]
    @applicant_user = params[:applicant_user]
  end
end
