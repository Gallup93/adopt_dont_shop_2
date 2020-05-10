require "rails_helper"

describe "user deletes a shelter" do
  describe "they link from the show page" do
    it "displays all shelters without the deleted shelter" do
      shelter_1 = Shelter.create(name: "Noah's Ark", address: "111 N 1st St",
                                 city: "Rockford", state: "Illinois", zip: "61109")
      shelter_2 = Shelter.create(name: "Helter Shelter", address: "666 7th St",
                                 city: "Chicago", state: "Illinois", zip: "60626")
      shelter_3 = Shelter.create(name: "Dany's Racoon Sanctuary", address: "123 Easy St",
                                 city: "Guernica", state: "Confusion", zip: "11111")

      visit "/shelters/#{shelter_2.id}"
      click_link "Delete"

      expect(current_path).to eq("/shelters")
      expect(page).to have_content(shelter_1.name)
      expect(page).to_not have_link(shelter_2.name)
      expect(page).to have_content(shelter_3.name)
    end
  end

# User Story 6, Shelter Delete
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
end
