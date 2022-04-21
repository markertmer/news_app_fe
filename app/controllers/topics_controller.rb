class TopicsController < ApplicationController
before_action :require_user

  def search
    keyword = params[:keyword]
    topic = TopicFacade.get_articles(keyword)
    article_array = topic.articles
    @articles = article_array.shuffle
    @name = topic.topic
  end
end
