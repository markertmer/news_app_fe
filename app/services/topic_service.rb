class TopicService

  def self.get_data(keyword)
    Rails.cache.fetch("get_data_#{keyword}", expires_in: 24.hours) do
      url = "https://news-app-be.herokuapp.com/api/v1/news?keyword=#{keyword}"
      response = Faraday.get(url)
      data = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
