require 'rails_helper'

# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

feature "Alternate Fuel Station Search" do
  context "visiting root - filling out form and clicking 'locate'" do
    before :each do
      visit root_path
      fill_in :q, with: "80203"
      click_button "Locate"

      # GET /api/alt-fuel-stations/v1/nearest.format?parameters
      # GET /api/alt-fuel-stations/v1/nearest.json?
        # api_key: T9CX2T4WAL0dvwRGpcXJEDc4IYw9IjWVFoK6bEXp (string)
        # location: 80203 (string)
        # radius : 6.0 (dec or string)
        
    end
    it 'redirects to search_path' do
      expect(current_path).to eq(search_path)
    end
    it 'shows 10 closests stations sorted by distance' do
      expect(all('.station')[0]).to have_content()
    end
  end
end
