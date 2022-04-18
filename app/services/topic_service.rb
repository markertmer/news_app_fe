class TopicService

  def self.get_data(keyword)
    url = "https://news-app-be.herokuapp.com/api/v1/news?keyword=#{keyword}"
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
