class ArticlesController < ApplicationController

  def index
    @report = Report.find(params[:report_id])
    @articles = @report.articles
  end

end
