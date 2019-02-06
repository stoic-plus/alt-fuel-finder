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
    let(:facade) { StationFacade.new("80203") }
    before :each do
      visit root_path
      fill_in :q, with: "80203"
      click_button "Locate"

      VCR.use_cassette("alt-fuel-stations/v1/nearest.json") do
        @stations = facade.get_stations(radius: "6.0", )
      end
    end
    it 'redirects to search_path' do
      expect(current_path).to eq(search_path)
    end
    # sort by distance using ruby -- Assert its the same order as @stations
    it 'shows 10 closests stations sorted by distance' do
      expect(page).to have_css(".station", count: 10)
      expect(all('.station')[0]).to have_content()
      expect(all('.station')[1]).to have_content()
      expect(all('.station')[2]).to have_content()
      expect(all('.station')[3]).to have_content()
      expect(all('.station')[4]).to have_content()
      expect(all('.station')[5]).to have_content()
      expect(all('.station')[6]).to have_content()
      expect(all('.station')[7]).to have_content()
      expect(all('.station')[8]).to have_content()
      expect(all('.station')[9]).to have_content()
    end
  end
end
