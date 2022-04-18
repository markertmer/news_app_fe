require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  before :each do
    json_response = File.read('spec/fixtures/topic_response.json')
    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=biden")
    .to_return(status: 200, body: json_response)

    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=supreme court")
    .to_return(status: 200, body: json_response)

    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=putin")
    .to_return(status: 200, body: json_response)

    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=will smith")
    .to_return(status: 200, body: json_response)

    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=billionares")
    .to_return(status: 200, body: json_response)

    oauth_response = File.read('spec/fixtures/omni_auth_stub.json')
    stub_request(:post, "/auth/google_oauth2")
    .to_return(status: 200, body: oauth_response)

    visit '/'

    click_button("Sign Up or Sign In to Spot the Spin!")

    # @user = User.new(name: 'Paul', email: 'paulpaulleonard@gmail.com')
    # session[:access_token] = auth_hash['credentials']['token']
    # session[:user_id] = @user.id

    # allow_any_instance_of(UsersController).to receive(:foo).and_return(:bar)


  end

  xit 'welcomes the user' do
    expect(page).to have_content("Welcome, #{user.name}.")
    expect(page).to have_content("This is your SPINSPOT")
  end

  it 'has a form to search' do
    require "pry"; binding.pry
    fill_in("Search Topics", with: "biden")
    click_button("Submit")
    expect(current_path).to eq("/search")
  end

  xit 'has buttons to browse' do
    expect(page).to have_button("Biden")
    expect(page).to have_button("Putin")
    expect(page).to have_button("Supreme Court")
    expect(page).to have_button("Will Smith")
    expect(page).to have_button("Billionaires")

    click_button("Supreme Court")
    expect(current_path).to eq("/search")
  end
end
