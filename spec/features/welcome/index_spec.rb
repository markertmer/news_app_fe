require 'rails_helper'

RSpec.describe 'welcome index page' do

  xit 'exists' do
    visit '/'
    expect(current_path).to eq('/')
  end

  xit 'has introductory info' do
    visit '/'
    expect(page).to have_content("SPINSPOT")
    expect(page).to have_content("Exposing Bias in News Reporting")
    expect(page).to have_content("In an age of information overload")
  end

  xit 'displays three articles' do
    # Need stub data to use for the content
    # data =
    visit '/'

    expect(page).to have_content("Recent Stories on #{data.topic}")

    within('#left') do
      expect(page).to have_link("Biden is Cool!") #headline
      expect(page).to have_content("Top Ten reasons why we LOVE Joe Biden. Click to read more!") #summary
      # expect(page).to have_content() #image
      find("img[alt='left-image']").click
      # expect(current_path).to eq("http://msnbc.com/biden-rules") #left-article URL
    end

    visit '/'

    within('#center') do
      expect(page).to have_link("Joe Biden: Human?") #headline
      expect(page).to have_content("We take a closer look at the personhood of the 46th president") #summary
      # expect(page).to have_content() #image
      find("img[alt='center-image']").click
      # expect(current_path).to eq("http://ap.com/is-biden-human") #center-article URL
    end

    visit '/'

    within('#right') do
      expect(page).to have_link("Biden is Coming for your Children") #headline
      expect(page).to have_content("Lock your doors! Load your guns! Hide your babies!") #summary
      # expect(page).to have_content() #image
      find("img[alt='right-image']").click
      # expect(current_path).to eq("http://faux-newz.com/biden-sux") #right-article URL
    end
  end

  xit 'sign-up/sign-in button present when user is not logged in' do
    visit '/'
    expect(page).to have_button("Sign Up or Sign In to Spot the Spin!")
    click_button("Sign Up or Sign In to Spot the Spin!")
    expect(current_path).to eq("/dashboard")
  end

  xit 'my spinspot button present when user is logged in' do
    # Oauth: sign in the user
    visit '/'
    expect(page).to have_button("Go to My SPINSPOT")
    click_button("Go to My SPINSPOT")
    expect(current_path).to eq("/dashboard")
  end

end
