class TopicsController < ApplicationController

  def search(keyword)
    topic = TopicFacade.get_articles(keyword)
    @articles = topic[:articles]
    @topic_name = topic[:topic]
    redirect_to "/topics/#{topic.topic}"
  end

  def show
    keyword = params[:topic]
    topic = TopicFacade.get_articles(keyword)
    @articles = topic[:articles]
    @topic_name = topic[:topic]
  end
end
