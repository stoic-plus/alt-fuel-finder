require 'rails_helper'

describe Station, type: :model do
  it 'exists' do
    station_facade = Station.new({})
    expect(station_facade).to be_a(Station)
  end

  it 'can have attributes' do
   attributes = {
     station_name: "polly pocket station",
     street_address: "123 Main st",
     city: "Denver",
     state: "CO",
     zip: "80203",
     fuel_type_code: "ELEC",
     distance: "2.3333",
     access_days_time: "24 hours daily"
   }

   station_facade = Station.new(attributes)
   expect(station_facade.station_name).to eq(attributes[:station_name])
   expect(station_facade.city).to eq(attributes[:city])
   expect(station_facade.state).to eq(attributes[:state])
   expect(station_facade.zip).to eq(attributes[:zip])
   expect(station_facade.street_address).to eq(attributes[:street_address])
   expect(station_facade.fuel_type_code).to eq(attributes[:fuel_type_code])
   expect(station_facade.distance).to eq(attributes[:distance])
   expect(station_facade.access_days_time).to eq(attributes[:access_days_time])
  end
end
