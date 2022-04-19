require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  let!(:user) {user = User.new({attributes: {name: 'Tester', email: 'fake_email@email.com'}})}

  before :each do
    OmniAuth.config.test_mode = true
    OmniAuth.config.silence_get_warning = true
    OmniAuth.config.add_mock(:google, {:uid => '12345'})
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(:user)


    json_response = File.read('spec/fixtures/topic_response.json')
    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=biden")
    .to_return(status: 200, body: json_response)

    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=supreme court")
    .to_return(status: 200, body: json_response)

    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=putin")
    .to_return(status: 200, body: json_response)

    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=will smith")
    .to_return(status: 200, body: json_response)

    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=billionaires")
    .to_return(status: 200, body: json_response)
  end

  it 'welcomes the user' do
    stub_omniauth
    visit '/'
    click_button("Sign Up or Sign In to Spot the Spin!")
    expect(page).to have_content("Welcome, #{user.name}.")
    expect(page).to have_content("This is your SPINSPOT")
  end

  it 'has a form to search' do
    stub_omniauth
    visit '/'
    click_button("Sign Up or Sign In to Spot the Spin!")
    fill_in(:keyword, with: "biden")
    click_button("Submit")
    expect(current_path).to eq("/search")
  end

  it 'has buttons to browse' do
    stub_omniauth
    visit '/'
    click_button("Sign Up or Sign In to Spot the Spin!")
    expect(page).to have_button("Biden")
    expect(page).to have_button("Putin")
    expect(page).to have_button("Supreme Court")
    expect(page).to have_button("Will Smith")
    expect(page).to have_button("Billionaires")

    click_button("Supreme Court")
    expect(current_path).to eq("/search")
  end
end
