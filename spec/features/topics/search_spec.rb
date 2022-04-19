require 'rails_helper'

RSpec.describe 'Topic Search Page', type: :feature do
  before :each do
    # Oauth logins
    # Need stub data to use for the content
    json_response = File.read('spec/fixtures/topic_response.json')
    stub_request(:get, "https://news-app-be.herokuapp.com/api/v1/news?keyword=biden")
    .to_return(status: 200, body: json_response)

    @data = JSON.parse(json_response)


    visit '/dashboard'
    fill_in("Search Topics", with: "biden")
    click_button("Submit")
  end

  it 'displays three articles' do

    expect(current_path).to eq("/search")

    expect(page).to have_content("Recent Stories on #{@data['topic'].titleize}")


    within('#left') do
      expect(page).to have_content("Biden is Cool!") #headline
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
