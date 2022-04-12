require 'rails_helper'

RSpec.describe 'welcome index page' do

  it 'exists' do
    visit '/'

    expect(current_path).to eq('/')

    expect(page).to have_content("Get Yo Newz Hurr")
  end

end
