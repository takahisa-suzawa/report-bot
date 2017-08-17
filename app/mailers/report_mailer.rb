class ReportMailer < ApplicationMailer
  default from: "from@example.com"

  def report_email
    mail to: ENV['ML_TO'], subject: '[週間セキュリ]'
  end
end
