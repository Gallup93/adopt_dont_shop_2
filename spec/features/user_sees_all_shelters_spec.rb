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

      fill_in :name, with: "Sage's Pigeon Pile"
      fill_in :address, with: "A Random Park"
      fill_in :city, with: "Denver"
      fill_in :state, with: "Colorado"
      fill_in :zip, with: "61735"

      click_on "Create Shelter"

      expect(current_path).to eq("/shelters")
      expect(page).to have_content("Sage's Pigeon Pile")
    end
  end
end
