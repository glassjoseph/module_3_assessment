require 'rails_helper'

RSpec.describe "User can search stores" do
    scenario "user sees nearby stores" do
      visit '/'

      fill_in "store_zip", with: 80202
      click_on "search"

      expect(current_path).to eq('/search')
      # And I should see stores within 25 miles of 80202
      # And I should see a message that says "16 Total Stores"

      # And I should see exactly 10 results
      expect(page).to have_selector('.store', count: 10)

      # And I should see the long name, city, distance, phone number and store type for each of the 10 result
      expect(page).to have_content("Name:")
      expect(page).to have_content("City:")
      expect(page).to have_content("Distance:")
      expect(page).to have_content("Phone Number:")
      expect(page).to have_content("Store Type")
      expect(page).to have_content("16 Total Stores")

      # https://api.bestbuy.com/v1/stores?format=json&show=city,longName,storeType,phone&apiKey=#{ENV['BEST_BUY_KEY']}&postalCode=80202&distance=25

    end
  end
