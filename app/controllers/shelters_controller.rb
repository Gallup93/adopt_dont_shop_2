class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find{|shelter| shelter.id = params[:id]}
  end
end
