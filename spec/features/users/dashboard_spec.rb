require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  before :each do
    # Oauth logins
    # @user =
    visit '/dashboard'
  end

  xit 'welcomes the user' do
    expect(page).to have_content("Welcome, #{user.name}.")
    expect(page).to have_content("This is your SPINSPOT")
  end

  xit 'has a form to search' do
    fill_in("Search Topics", with: "obama")
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
