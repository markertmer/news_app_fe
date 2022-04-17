require 'rails_helper'

RSpec.describe 'welcome index page' do

  it 'exists' do
    visit '/'
    expect(current_path).to eq('/')
  end

  it 'has introductory info' do
    expect(page).to have_content("SPINSPOT")
    expect(page).to have_content("Exposing Bias in News Reporting")
    expect(page).to have_content("In an age of information overload")
  end

  xit 'displays three articles' do

  end

  it 'has a button to sign up or sign in' do
    expect(page).to have_button("Sign Up or Sign In to Spot the Spin!")
    click_button("Sign Up or Sign In to Spot the Spin!")
    # expect(current_path).to eq("/auth/google_oauth2")
  end

end
