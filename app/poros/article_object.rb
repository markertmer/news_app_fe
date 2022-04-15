class ArticleObject
  attr_reader :side, :title, :summary, :source, :url, :photo_url

  def initialize(article_side, article)
    @side = article_side.to_s[0..-9]
    @title = article[:title]
    @summary = article[:summary]
    @source = article[:source]
    @url = article[:url]
    @photo_url = article[:photo_url]
  end
end
