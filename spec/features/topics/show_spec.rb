require 'rails_helper'

RSpec.describe 'Topic Show Page', type: :feature do
  describe 'When a user visits a topic show page' do
    before :each do
      data = {
        "topic": "Biden",
        "type": "articles",
        "data": {
          "left_article": {
            "title": "Biden is Cool!",
            "summary": "Top Ten reasons why we LOVE Joe Biden. Click to read more!",
            "source": "MSNBC",
            "url": "http://msnbc.com/biden-rules",
            "photo_url": "http://msnbc.com/biden-rules/image.jpg"
          },
          "center_article": {
            "title": "Joe Biden: Human?",
            "summary": "We take a closer look at the personhood of the 46th president",
            "source": "Associated Press",
            "url": "http://ap.com/is-biden-human",
            "photo_url": "http://ap.com/is-biden-human/image.jpg"
          },
          "right_article": {
            "title": "Biden is Coming for your Children",
            "summary": "Lock your doors! Load your guns! Hide your babies!",
            "source": "Faux Newz",
            "url": "http://faux-newz.com/biden-sux",
            "photo_url": "http://faux-newz.com/biden-sux/image.jpg"
          }
        }
      }
      @topic = TopicObject.new(data)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
  end
end
