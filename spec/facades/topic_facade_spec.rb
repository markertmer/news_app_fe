equire 'rails_helper'

RSpec.describe 'Topic Facade', type: :facade do

  it 'returns 3 articles related to a headline' do
    topic = TopicFacade.get_info('Biden')

    expect(topic.class).to be()


  end
end
