# Preview all emails at http://localhost:3000/rails/mailers/trade_mailer
class TradeMailerPreview < ActionMailer::Preview

  def request_email
    TradeMailer.with(request_user: User.find(4), applicant_user: User.find(2)).request_email
  end

  def applicant_email
    TradeMailer.with(applicant_user: User.find(2), request_user: User.find(4)).applicant_email
  end
end
