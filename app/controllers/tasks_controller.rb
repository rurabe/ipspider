class TasksController < ApplicationController
  def create
    heroku = Heroku::API.new
    heroku.post_ps('ipspider',"rake spider:crawl[#{params[:url]},#{params[:channel]}]")
    render :nothing => true
  end
end
