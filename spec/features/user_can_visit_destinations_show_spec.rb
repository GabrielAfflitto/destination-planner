require 'rails_helper'


describe "user can visit destinations show page" do
  context "when a user visits a specific destination page" do
    it "they should see information regarding each destination" do
      dest1 = create(:destination)
      dest2, dest3 = create_list(:destination, 2)
      visit root_path

      within ".destinations" do
        expect(page).to have_content(dest1.name)
        expect(page).to have_content("Show")
      end

      within(first(".destination")) do
        click_on "Show"
      end

      expect(current_path).to eq(destination_path(dest1))
      # save_and_open_page
      expect(page).to have_content(dest1.name)
      expect(page).to have_content(dest1.zip)
      expect(page).to have_content(dest1.description)
      expect(page).to have_content(dest1.forecast)
    end
  end
end


# As a user
# When I visit "/"
# And I click on a destination
# Then I should be on page "/destinations/:id"
# Then I should see the destination's name, zipcode, description, and 10 day weather forecast
# The weather forecast is specific to the destination whose page I'm on
# The forecast should include date (weekday, month and day), high and low temps (F), and weather conditions
