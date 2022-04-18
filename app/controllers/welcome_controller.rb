class WelcomeController < ApplicationController

  def index
    keyword = ["biden", "putin", "supreme court", "will smith", "billionaires"].sample
    topic = TopicFacade.get_articles(keyword)
    @articles = topic.articles
    @name = topic.topic
  end
end
