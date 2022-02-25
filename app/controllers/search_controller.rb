class SearchController < ApplicationController
  def index
    @location = params[:location]
    @charger= SearchFacade.closest_charger_info(@location)
  end
end
