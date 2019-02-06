class SearchController < ApplicationController
  def index
    @stations = StationFacade.new(station_facade_params)
  end

  private

  def station_facade_params
    params.permit(:q)
  end
end
