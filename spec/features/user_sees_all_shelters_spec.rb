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
      expect(page).to have_content(shelter_2.zip)
      expect(page).to have_content(shelter_3.state)
    end
  end
end
