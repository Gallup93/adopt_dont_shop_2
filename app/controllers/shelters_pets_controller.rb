class SheltersPetsController < ApplicationController
  def index
    @shelter = Shelter.find{|shelter| shelter.id.to_s == params[:id]}
    all_pets = Pet.all
    @pets = all_pets.find_all{|pet| pet.shelter_id.to_i == params[:id].to_i}
  end
end
