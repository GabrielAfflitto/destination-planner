class WundergroundService
  attr_reader :response

  def initialize(zip)
    @response = Faraday.get "http://api.wunderground.com/api/#{ENV['weather_key']}/forecast10day/q/#{zip}.json"
  end

  def to_json
    JSON.parse(@response.body, symbolize_names: true)[:forecast][:simpleforecast][:forecastday]
  end

end
