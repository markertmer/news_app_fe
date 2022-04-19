require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  before :each do
    json_response = File.read('spec/fixtures/topic_response.json')
    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=biden")
    .to_return(status: 200, body: json_response)

    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=supreme court")
    .to_return(status: 200, body: json_response)
    #
    # stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=putin")
    # .to_return(status: 200, body: json_response)
    #
    # stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=will smith")
    # .to_return(status: 200, body: json_response)
    #
    # stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=billionares")
    # .to_return(status: 200, body: json_response)

    # oauth_response = File.read('spec/fixtures/omni_auth_stub.json')
    # stub_request(:post, "/auth/google_oauth2")
    # .to_return(status: 200, body: oauth_response)
    # auth_hash = File.read('spec/fixtures/auth_hash.json')
    # stub_request(:get, '/auth/google_oauth2/callback')
    # .to_return(status: 200, body: auth_hash)




    # allow_any_instance_of(Request).to receive().and_return({
    #   "session_id": "e970d27ef6cdc5b22d47642e9a71b36a",
    #   "_csrf_token": "KVtxm+gC4ep0EV3P2NMPzHh+AVTUu3L7XXJYdlXSJAU=",
    #   "csrf": "kg705NcBevp0Qe2nIdcYPimMe8VNxAxeMR9n3HnY2qE=",
    #   "access_token": "ya29.A0ARrdaM_X1pW-qB0b2LyVJz-NfFTd4AykPXDlDrTF2HNtjjlCW1xAJ2YrwnsLNR04mE2Rh6IUPyUUOprSuIOxf1tVlbu5j_fkW9OxRsmjGsIf-HQTUSSir2dK5LB6I2Zy8WlTkC1YKXGp-3SspTWGiu_8jvnQ",
    #   "user_id": user.id
    #   })


    # allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(:)
    visit '/dashboard'

    # visit '/dashboard'
    #
    # click_button("Sign Up or Sign In to Spot the Spin!")
    # allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(:current_user)

    # allow_any_instance_of(UsersController).to receive(:foo).and_return(:bar)


  end

  xit 'welcomes the user' do
    expect(page).to have_content("Welcome, #{user.name}.")
    expect(page).to have_content("This is your SPINSPOT")
  end

  xit 'has a form to search' do
    fill_in(:keyword, with: "biden")
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
