class Station
  attr_reader :station_name,
              :city,
              :state,
              :zip,
              :street_address,
              :fuel_type_code,
              :distance,
              :access_days_time

  def initialize(attributes)
    @station_name = attributes[:station_name]
    @city = attributes[:city]
    @state = attributes[:state]
    @zip = attributes[:zip]
    @street_address = attributes[:street_address]
    @fuel_type_code = attributes[:fuel_type_code]
    @distance = attributes[:distance]
    @access_days_time = attributes[:access_days_time]
  end
end
