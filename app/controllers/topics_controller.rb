class TopicsController < ApplicationController

  def show
    keyword = params[:keyword]
    topic = TopicFacade.get_articles(keyword)
    @articles = topic[:articles]
    @topic_name = topic[:topic]
  end
end
