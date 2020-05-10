require "rails_helper"

describe "user sees all shelters" do
  describe "they visit /shelters" do
    it "displays all shelters" do

      shelter_1 = Shelter.create(name: "Noah's Ark", address: "111 N 1st St",
                                 city: "Rockford", state: "Illinois", zip: "61109")
      shelter_2 = Shelter.create(name: "Helter Shelter", address: "666 7th St",
                                 city: "Chicago", state: "Illinois", zip: "60626")
      shelter_3 = Shelter.create(name: "Dany's Racoon Sanctuary", address: "123 Easy St",
                                 city: "Guernica", state: "Confusion", zip: "11111")

      visit '/shelters'

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
      expect(page).to have_content(shelter_3.name)
    end
  end
  describe "they click link 'New Shelter'" do
    it "redirects them to /shelters/new" do
      visit "/shelters"
      click_on "New Shelter"
      expect(current_path).to eq("/shelters/new")
        it "shows a form to create a new shelter" do
          fill_in :name, with: "Sage's Pigeon Pile"
          fill_in :address, with: "536 Ratbird St"
          fill_in :city, with: "Paris"
          fill_in :state, with: "Florida"
          fill_in :zip, with: "61735"

          click_on "Create Shelter"
          expect(current_path).to eq("/shelters")
          expect(page).to have_content("Sage's Pigeon Pile")
        end
    end
  end
end


# User Story 4, Shelter Creation
#
# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
