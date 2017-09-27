class ArticlesController < ApplicationController

  def index
    @report = Report.find(params[:report_id])
    @articles = @report.articles
  end

  def edit
    @report = Report.find(params[:report_id])
    @article = @report.articles.find(params[:id])
  end

end
