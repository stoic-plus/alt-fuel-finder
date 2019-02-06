class StationService
  def initialize(zip)
    @zip = zip
  end

  def get_stations(search)
    url = form_url(radius: search[:radius], fuel_types: search[:fuel_types], limit: search[:limit])
    get_json(url)
  end

  private

  def form_url(attr)
    "?api_key=#{ENV["API_KEY"]}&location=#{@zip}&radius=#{attr[:radius]}&status=E&fuel_type=#{attr[:fuel_types]}&limit=#{attr[:limit]}"
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
