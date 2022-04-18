# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'access search articles page' do
  mock_auth_hash = OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                                                                                        provider: 'google_oauth2',
                                                                                        uid: '123456789',
                                                                                        info: {
                                                                                          first_name: 'Happy Lama',
                                                                                          email: 'happy.lama@example.com'
                                                                                        },
                                                                                        credentials: {
                                                                                          token: 'token',
                                                                                          refresh_token: 'another_token',
                                                                                          expires_at: 1_354_920_555,
                                                                                          expires: true
                                                                                        }
                                                                                      })

  it 'can create an account using google_oauth2' do
    visit root_path
    click_link 'Create an account'
    expect(current_path).to eq(register_path)
    expect(page).to have_button('Join with Google')
    mock_auth_hash
    click_button 'Join with Google'
    expect(page).to have_content('Happy Lama')
    expect(page).to have_button('Sign out')
  end

  it 'user can sign in using google_oauth2' do
    visit root_path
    expect(page).to have_content('Sign in with Google')
    mock_auth_hash
    click_link 'Sign in'
    expect(page).to have_content('Happy Lama')
    expect(page).to have_button('Sign out')
  end

  it 'can handle an authentication error' do
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    visit root_path
    click_link 'Sign in with Google'
    expect(page).to have_content('invalid_credentials')
  end
end
