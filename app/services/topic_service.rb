class TopicService
  
  def self.get_data(keyword)
    url = "sample_url/#{keyword}"
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
