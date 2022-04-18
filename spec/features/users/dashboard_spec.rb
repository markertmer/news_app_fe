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

    # oauth_response = File.read('spec/fixtures/omni_auth_stub.json')
    # stub_request(:post, "/auth/google_oauth2")
    # .to_return(status: 200, body: oauth_response)

    user = User.new(name: 'Paul', email: 'paulleonard4657@gmail.com')

    allow_any_instance_of(Request).to receive().and_return({
      "session_id": "e970d27ef6cdc5b22d47642e9a71b36a",
      "_csrf_token": "KVtxm+gC4ep0EV3P2NMPzHh+AVTUu3L7XXJYdlXSJAU=",
      "csrf": "kg705NcBevp0Qe2nIdcYPimMe8VNxAxeMR9n3HnY2qE=",
      "access_token": "ya29.A0ARrdaM_X1pW-qB0b2LyVJz-NfFTd4AykPXDlDrTF2HNtjjlCW1xAJ2YrwnsLNR04mE2Rh6IUPyUUOprSuIOxf1tVlbu5j_fkW9OxRsmjGsIf-HQTUSSir2dK5LB6I2Zy8WlTkC1YKXGp-3SspTWGiu_8jvnQ",
      "user_id": user.id
      })

    visit '/dashboard'

    # click_button("Sign Up or Sign In to Spot the Spin!")

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
