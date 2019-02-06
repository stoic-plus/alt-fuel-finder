require 'rails_helper'

describe StationService, type: :service do
  context '#get_stations' do
    let(:service) { StationService.new("80203") }
    it 'returns stations JSON using zip - given radius, fuel_types, and limit' do
      VCR.use_cassette("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json") do
        stations = service.get_stations(radius: "6.0", fuel_types: "ELEC,LPG", limit: "10")
        first = stations.first

        expect(stations.count).to eq(10)
        expect(first).to have_key(:station_name)
        expect(first).to have_key(:street_address)
        expect(first).to have_key(:city)
        expect(first).to have_key(:state)
        expect(first).to have_key(:zip)
        expect(first).to have_key(:fuel_type_code)
        expect(first).to have_key(:distance)
        expect(first).to have_key(:access_days_time)
      end
    end
  end
end
