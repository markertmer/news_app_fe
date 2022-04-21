class TopicsController < ApplicationController
before_action :require_user

  def search
    keyword = params[:keyword]
    if keyword == ""
      redirect_to('/dashboard')
      flash.notice = "Field cannot be blank"
    else
      topic = TopicFacade.get_articles(keyword)
      @articles = topic.articles
      @name = topic.topic
    end
  end
end
