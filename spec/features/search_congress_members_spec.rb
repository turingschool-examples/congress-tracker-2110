require 'rails_helper'

RSpec.describe 'Govt Search' do
  describe 'happy path' do
    it 'allows user to search for govt members' do
      VCR.use_cassette('propublica_members_of_the_senate', re_record_interval: 2.days) do

        visit root_path

        fill_in :search, with: 'Sanders'
        click_button 'Search'

        expect(page.status_code).to eq 200
        expect(page).to have_content("Senator Bernard Sanders was found!")
        expect(page).to have_content("SenSanders")
      end
    end

    it 'allows user to search for another govt member', :vcr do
      visit root_path

      fill_in :search, with: 'Booker'
      click_button 'Search'

      expect(page.status_code).to eq 200
      expect(page).to have_content("Senator Cory Booker was found!")
      expect(page).to have_content("SenBooker")
    end
  end
end
