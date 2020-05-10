
require "rails_helper"

describe "user sees all pets of a given shelter_id" do
  it "displays information for one shelter" do
    shelter_1 = Shelter.create(name: "Noah's Ark", address: "111 N 1st St",
                               city: "Rockford", state: "Illinois", zip: "61109")
    shelter_2 = Shelter.create(name: "Helter Shelter", address: "666 7th St",
                               city: "Chicago", state: "Illinois", zip: "60626")

    pet_1 = Pet.create(image: "spot-pic", name: "Spot",
                               age: "6", sex: "male", shelter_id: "#{shelter_1.id}")
    pet_2 = Pet.create(image: "puppet-pic", name: "Puppet",
                               age: "5", sex: "female", shelter_id: "#{shelter_1.id}")
    pet_3 = Pet.create(image: "turtle-pic", name: "Turtle",
                               age: "100", sex: "female", shelter_id: "#{shelter_2.id}")

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_2.name)
    expect(page).to_not have_content(pet_3.name)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_2.age)
  end

  # describe "they click link 'Create Pet'" do
  #   it "redirects them to /shelters/:shelter_id/pets/new" do
  #
  #     shelter_1 = Shelter.create(name: "Noah's Ark", address: "111 N 1st St",
  #                                city: "Rockford", state: "Illinois", zip: "61109")
  #     shelter_2 = Shelter.create(name: "Helter Shelter", address: "666 7th St",
  #                                city: "Chicago", state: "Illinois", zip: "60626")
  #
  #     pet_1 = Pet.create(image: "spot-pic", name: "Spot",
  #                                age: "6", sex: "male", shelter_id: "#{shelter_1.id}")
  #     pet_2 = Pet.create(image: "puppet-pic", name: "Puppet",
  #                                age: "5", sex: "female", shelter_id: "#{shelter_1.id}")
  #     pet_3 = Pet.create(image: "turtle-pic", name: "Turtle",
  #                                age: "100", sex: "female", shelter_id: "#{shelter_2.id}")
  #
  #
  #
  #     visit "/shelters/#{shelter_2.id}/pets/new"
  #
  #     fill_in :image, with: "pet-pic"
  #     fill_in :name, with: "Elwood"
  #     fill_in :description, with: "Cool as a cucumber"
  #     fill_in :age, with: "7"
  #     fill_in :sex, with: "male"
  #
  #     click_on "Create Pet"
  #     expect(current_path).to eq("/pets")
  #     expect(page).to have_content("Elwood")
  #   end
  # end
end
