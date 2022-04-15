class TopicsController < ApplicationController

  def show
    keyword = params[:topic]
    require "pry"; binding.pry
    topic = TopicFacade.get_articles(keyword)
    @articles = topic[:articles]
    @topic_name = topic[:topic]
  end
end
