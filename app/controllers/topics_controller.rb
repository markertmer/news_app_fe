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
    def valid_characters_v2(str)
      # You know what, god bless Dennis Ritchie, but I hate Regex
      !(str =~ /[ \$ \: \; \* \! \# \@ \% \^ \& \( \) \? \> \< \. \[ \] \\ \/ ]/)
    end

    # User gives us a keyword
    # keyword -> backend
    # keyword.contains($:;*, etc...) -> backend breaks
    # find_valid_characters(keyword)
    # find_valid_characters(keyword) = true IF keyword.does_not_contain ["$", ":", ";", "*", "!", "#", "@", "%", "^", "&", "(", ")", "?", ">", "<", ".", "'", "[", "]"]

    def valid_characters(keyword)
      array = ["$", ":", ";", "*", "!", "#", "@", "%", "^", "&", "(", ")", "?", ">", "<", ".", "'", "[", "]"]
      valid = true
      array.each do |character|
        if keyword.include?(character)
          valid = false
        end
      end
      valid
    end
end
