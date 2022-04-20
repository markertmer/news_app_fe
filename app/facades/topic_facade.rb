class TopicFacade

  def self.get_articles(keyword)
    data = TopicService.get_data(keyword)
    TopicObject.new(data)
  end
end
