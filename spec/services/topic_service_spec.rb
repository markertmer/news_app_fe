require 'rails_helper'

RSpec.describe 'Topic Service', type: :service do

  it 'gets article data for a given topic' do
    json_response = File.read('spec/fixtures/topic_response.json')
    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=biden")
    .to_return(status: 200, body: json_response)

    topic = TopicService.get_data('biden')

    expect(topic[:topic]).to eq('biden')
    expect(topic[:type]).to eq('articles')

    expect(topic[:data]).to be_a Hash
    expect(topic[:data].count).to be(3)

    expect(topic[:data].keys[0]).to eq(:left_article)
    expect(topic[:data][:left_article].keys).to eq([:title, :summary, :source, :url, :photo_url])
    expect(topic[:data].keys[1]).to eq(:center_article)
    expect(topic[:data][:center_article].keys).to eq([:title, :summary, :source, :url, :photo_url])
    expect(topic[:data].keys[2]).to eq(:right_article)
    expect(topic[:data][:right_article].keys).to eq([:title, :summary, :source, :url, :photo_url])
  end

end
