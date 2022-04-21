class WelcomeController < ApplicationController

  def index
    keyword = ["biden", "putin", "supreme court", "will smith", "billionaires"].sample
    topic = TopicFacade.get_articles(keyword)
    article_array = topic.articles
    @articles = article_array.shuffle
    @name = topic.topic
  end

  def show

  end
end
