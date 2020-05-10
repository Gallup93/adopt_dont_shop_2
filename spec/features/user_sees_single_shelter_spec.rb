require "rails_helper"

describe "user sees a single shelter" do
  describe "they link from the shelter index" do
    it "displays information for one shelter" do

      shelter = Shelter.create(name: "Helter Shelter", address: "666 7th St",
                                 city: "Chicago", state: "Illinois", zip: "60626")

      visit "/shelters/#{shelter.id}"

      expect(page).to have_content(shelter.name)
      expect(page).to have_content(shelter.address)
      expect(page).to have_content(shelter.city)
      expect(page).to have_content(shelter.state)
      expect(page).to have_content(shelter.zip)
    end
  end
end
