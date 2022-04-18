require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  before :each do
    json_response = File.read('spec/fixtures/topic_response.json')
    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=biden")
    .to_return(status: 200, body: json_response)
    # @user = User.new(name: 'Paul', email: 'paulpaulleonard@gmail.com')
    # session[:access_token] = auth_hash['credentials']['token']
    # session[:user_id] = @user.id

    # allow_any_instance_of(UsersController).to receive(:foo).and_return(:bar)
    visit '/dashboard'
  end

  xit 'welcomes the user' do
    expect(page).to have_content("Welcome, #{user.name}.")
    expect(page).to have_content("This is your SPINSPOT")
  end

  xit 'has a form to search' do
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
