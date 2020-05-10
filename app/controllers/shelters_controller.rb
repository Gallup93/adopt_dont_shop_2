class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find{|shelter| shelter.id.to_s == params[:id]}
  end

  def new
  end

  def create
    @shelter = Shelter.new(shelter_params)
    @shelter.save
    redirect_to "/shelters"
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
