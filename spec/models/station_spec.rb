require 'rails_helper'

describe Station, type: :model do
  it 'exists' do
    station_facade = Station.new({})
    expect(station_facade).to be_a(Station)
  end

  it 'can have attributes' do
   attributes = {
     name: "polly pocket station",
     address: "123 Main st.",
     fuel_type: "ELEC",
     distance: "2.3333",
     access_days_time: "24 hours daily"
   }

   station_facade = Station.new(attributes)
   expect(station_facade.name).to eq(attributes[:name])
   expect(station_facade.address).to eq(attributes[:address])
   expect(station_facade.fuel_type).to eq(attributes[:fuel_type])
   expect(station_facade.distance).to eq(attributes[:distance])
   expect(station_facade.access_days_time).to eq(attributes[:access_days_time])
  end
end
