class TopicsController < ApplicationController
before_action :require_user

  def search
    keyword = params[:keyword]
    if keyword == ""
      redirect_to('/dashboard')
      flash.notice = "Field cannot be blank"
    elsif valid_characters(keyword) == false
      redirect_to('/dashboard')
      flash.notice = "Search contained improper characters please try again!"
    else
      topic = TopicFacade.get_articles(keyword)
      article_array = topic.articles
      @articles = article_array.shuffle
      @name = topic.topic
    end
  end

  private
    def valid_characters(keyword)
      !(keyword =~ /[ \$ \: \; \* \! \# \@ \% \^ \& \( \) \? \> \< \. \[ \] \\ \/ \{ \} ]/)
    end
end
