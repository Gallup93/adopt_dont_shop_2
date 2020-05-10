require "rails_helper"

describe "user clicks on the 'Update Shelter' link" do

    it "taken to '/shelters/:id/edit' where I see a form to edit the shelter's data" do
      shelter_2 = Shelter.create(name: "Helter Shelter", address: "666 7th St",
                                 city: "Chicago", state: "Illinois", zip: "60626")

      visit "/shelters/#{shelter_2.id}"
      click_on "Update Shelter"
      expect(current_path).to eq("/shelters/#{shelter_2.id}/edit")
      # expect(page).to have_content("Edit Shelter")
      # expect(page).to have_content(shelter_2.name)
      # click_on "Edit Shelter"

      # expect(current_path).to eq("/shelters/#{shelter_2.id}/edit")
      # expect(page).to have_content("Update Shelter: #{shelter_2.name}")

      fill_in :name, with: "Heck'n Helter Shelter"
      fill_in :address, with: "1060 W Addison"
      fill_in :city, with: "Chicago"
      fill_in :state, with: "Illinois"
      fill_in :zip, with: "61108"

      click_on "Update Shelter"

      expect(current_path).to eq("/shelters/#{shelter_2.id}")
      expect(page).to have_content("Heck'n Helter Shelter")
      expect(page).to have_content("61108")
    end
  end
