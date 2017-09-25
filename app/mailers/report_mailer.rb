require 'date'

class ReportMailer < ApplicationMailer
  default from: "from@example.com"

  def report_email
    day = Date.today
    @report = Report.find_by('deliver_date >= ?', day)
    mail to: ENV['ML_TO'], subject: '[週間セキュリ]'
  end
end
