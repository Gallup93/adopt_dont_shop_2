class SheltersPetsController < ApplicationController
  def index
    @shelter = Shelter.find{|shelter| shelter.id.to_s == params[:id]}
    all_pets = Pet.all
    @pets = all_pets.find_all{|pet| pet.shelter_id.to_i == params[:id].to_i}
  end

  def new

  end

  def create
    @pet= Pet.new(pet_params)
    @pet.save
    redirect_to "/pets"
  end

  private

  def pet_params
    params.permit(:image, :name, :description, :age, :sex)
  end
end
