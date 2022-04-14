require 'rails_helper'

RSpec.describe 'Article Object', type: :poro do

  it 'creates an object for an article from the JSON response' do
    article = {"attributes": {
        "title": "Biden BLASTED over gaffe!",
        "summary": "Joe Biden HATES it when you do this one simple thing.",
        "source": "Faux News",
        "url": "https://faux-news.fake",
        "photo_url": "https://faux-news.fake/image"
      }}

    object = ArticleObject.new(article)

    expect(object).to be_instance_of(ArticleObject)
    expect(object.title).to eq("Biden BLASTED over gaffe!")
    expect(object.summary).to eq("Joe Biden HATES it when you do this one simple thing.")
    expect(object.source).to eq("Faux News")
    expect(object.url).to eq("https://faux-news.fake")
    expect(object.photo_url).to eq("https://faux-news.fake/image")
  end
end
