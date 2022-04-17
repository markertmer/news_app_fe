class TopicsController < ApplicationController
before_action :require_user

  def search
    keyword = params[:keyword]
    topic = TopicFacade.get_articles(keyword)
    @articles = topic[:articles]
    @name = topic[:topic]
    # redirect_to "/topics/#{topic.topic}"
  end

  # def show
  #   keyword = params[:topic]
  #   topic = TopicFacade.get_articles(keyword)
  #   @articles = topic[:articles]
  #   @name = topic[:topic]
  # end
end
