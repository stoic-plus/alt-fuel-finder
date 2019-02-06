class StationFacade
  def initialize(zip)
    @zip = zip
  end

  def get_stations
    stations = service.get_stations
    stations.map do |raw_station|
      Station.new(raw_station)
    end
  end

  private

  def service
    StationService.new(@zip)
  end
end
