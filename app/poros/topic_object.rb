class TopicObject
  attr_reader :type, :topic, :articles

  def initialize(data)
    @topic = data[:topic]
    @type = data[:type]
    @articles = create_articles(data[:data])
  end

  def create_articles(data)
    data.map do |article_side, attributes|
      ArticleObject.new(article_side, attributes[:attributes])
    end
  end
end
