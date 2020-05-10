class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find{|shelter| shelter.id.to_s == params[:id]}
  end

  def new

  end
end
