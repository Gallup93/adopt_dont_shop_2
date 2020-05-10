require "rails_helper"

describe "user sees a single pet" do
  it "displays information for one pet" do

    shelter = Shelter.create(name: "Helter Shelter", address: "666 7th St",
                               city: "Chicago", state: "Illinois", zip: "60626")
    pet = Pet.create(image: "puppet-pic", name: "Puppet",
                               age: "5", sex: "female", shelter_id: "#{shelter.id}")

    visit "/pets/#{pet.id}"

    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.shelter_id)
  end
end


# User Story 9, Pet Show
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status
