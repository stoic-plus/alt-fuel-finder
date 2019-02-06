require 'rails_helper'

describe StationFacade, type: :facade do
  context '#get_stations' do
    it 'returns station objects given a location' do
      VCR.use_cassette("alt-fuel-stations/v1/nearest.json") do
        station_facade = StationFacade.new("80203")
        stations = station_facade.get_stations
        first = stations.first

        expect(stations.count).to eq(281)
        expect(first).to respond_to(:name)
        expect(first).to respond_to(:address)
        expect(first).to respond_to(:fuel_type)
        expect(first).to respond_to(:distance)
        expect(first).to respond_to(:access_days_time)
      end
    end
  end
end
