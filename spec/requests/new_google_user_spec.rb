require 'rails_helper'
Rspec.describe 'access search articles page' do
  it 'can create an account using google_oauth2' do
    visit root_path
    click_link "Create an account"
    expect(current_path).to eq(register_path)
    click_button "Join with Google"
    mock_auth_hash
    page.should have_content("Happy Lama")
    page.should have_content("Sign out")
  end
  xit 'user can sign in using google_oauth2' do
    visit root_path
    click_link "Sign in"
    mock_auth_hash
    page.should have_content("Happy Lama")
    page.should have_content("Sign out")
  end
  xit 'can handle an authentication error' do
    OmniAuth.config.mock_auth[:google] = :invalid_credentials
    visit root_path
    click_link "Sign in with Google"
    page.should have_content('Authentication failed.')
  end
end
