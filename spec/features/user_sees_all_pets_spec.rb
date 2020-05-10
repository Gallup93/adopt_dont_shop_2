require "rails_helper"

describe "user sees all pets" do
  describe "they visit /pets" do
    it "displays all pets" do
      shelter_1 = Shelter.create(name: "Noah's Ark", address: "111 N 1st St",
                                 city: "Rockford", state: "Illinois", zip: "61109")
      shelter_2 = Shelter.create(name: "Helter Shelter", address: "666 7th St",
                                 city: "Chicago", state: "Illinois", zip: "60626")

      pet_1 = Pet.create(image: "spot-pic", name: "Spot",
                                 age: "6", sex: "male", shelter_id: "#{shelter_1.id}")
      pet_2 = Pet.create(image: "puppet-pic", name: "Puppet",
                                 age: "5", sex: "female", shelter_id: "#{shelter_2.id}")

      visit '/pets'

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_3.name)
    end
  end
end

# User Story 7, Pet Index
#
# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
