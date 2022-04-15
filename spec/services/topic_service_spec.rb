require 'rails_helper'

RSpec.describe 'Topic Service', type: :service do

  xit 'gets article data for a given topic' do
    topic = TopicService.get_data('Biden')

    expect(topic[:topic]).to eq('Biden')
    expect(topic[:type]).to eq('articles')

    expect(topic[:data]).to be(Array)
    expect(topic[:data].count).to be(3)

    expect(topic[:data][0].keys).to eq(["left_article"])
    expect(topic[:data][0][:attributes].keys).to eq([:title, :summary, :source, :url, :photo_url])
    expect(topic[:data][1].keys).to eq(["center_article"])
    expect(topic[:data][1][:attributes].keys).to eq([:title, :summary, :source, :url, :photo_url])
    expect(topic[:data][2].keys).to eq(["right_article"])
    expect(topic[:data][2][:attributes].keys).to eq([:title, :summary, :source, :url, :photo_url])
  end

end
