require 'rails_helper'

RSpec.describe 'Topic Facade', type: :facade do
  before do
    json_response = File.read('spec/fixtures/topic_response.json')
    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=biden")
    .to_return(status: 200, body: json_response)
  end

  it 'returns 3 articles related to a headline' do
    topic = TopicFacade.get_articles('biden')

    expect(topic.class).to be(TopicObject)

    expect(topic.topic).to eq('biden')

    expect(topic.articles).to be_a Array

    left_article = topic.articles[0]
    center_article = topic.articles[1]
    right_article = topic.articles[2]

    expect(left_article).to be_a ArticleObject
    expect(left_article.side).to eq("left")
    expect(left_article.title).to eq("Biden is Cool!")
    expect(left_article.summary).to eq("Top Ten reasons why we LOVE Joe Biden. Click to read more!")
    expect(left_article.source).to eq("MSNBC")
    expect(left_article.url).to eq("http://msnbc.com/biden-rules")
    expect(left_article.photo_url).to eq("http://msnbc.com/biden-rules/image.jpg")

    expect(center_article).to be_a ArticleObject
    expect(center_article.side).to eq("center")
    expect(center_article.title).to eq("Joe Biden: Human?")
    expect(center_article.summary).to eq("We take a closer look at the personhood of the 46th president")
    expect(center_article.source).to eq("Associated Press")
    expect(center_article.url).to eq("http://ap.com/is-biden-human")
    expect(center_article.photo_url).to eq("http://ap.com/is-biden-human/image.jpg")

    expect(right_article).to be_a ArticleObject
    expect(right_article.side).to eq("right")
    expect(right_article.title).to eq("Biden is Coming for your Children")
    expect(right_article.summary).to eq("Lock your doors! Load your guns! Hide your babies!")
    expect(right_article.source).to eq("Faux Newz")
    expect(right_article.url).to eq("http://faux-newz.com/biden-sux")
    expect(right_article.photo_url).to eq("http://faux-newz.com/biden-sux/image.jpg")
  end
end
