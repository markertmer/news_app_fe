require 'rails_helper'

RSpec.describe 'Topic Search Page', type: :feature do
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

    @data = JSON.parse(json_response)
  end

  it 'displays three articles' do
    stub_omniauth
    visit '/'
    click_button("Sign Up or Sign In to Spot the Spin!")

    expect(current_path).to eq("/dashboard")

    fill_in("Search Topics", with: "biden")
    click_button('Submit')

    expect(current_path).to eq("/search")
    expect(page).to have_content("Recent Stories on #{@data['topic'].titleize}")

    within('#left') do
      expect(page).to have_content("Biden is Cool!")
      expect(page).to have_content("Top Ten reasons why we LOVE Joe Biden. Click to read more!") #summary
      # expect(page).to have_content() #image
      # find("img[alt='left-image']").click
      # expect(current_path).to eq() #left-article URL
    end

    within('#center') do
      expect(page).to have_content("Joe Biden: Human?") #headline
      expect(page).to have_content("We take a closer look at the personhood of the 46th president") #summary
      # expect(page).to have_content() #image
      # click_link() #headline
      # expect(current_path).to eq() #center-article URL
    end

    within('#right') do
      expect(page).to have_content("Biden is Coming for your Children") #headline
      expect(page).to have_content("Lock your doors! Load your guns! Hide your babies!") #summary
      # expect(page).to have_content() #image
      # find("img[alt='right-image']").click
      # expect(current_path).to eq() #right-article URL
    end
  end
end
