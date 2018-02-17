class WundergroundService
  attr_reader :response

  def initialize(zip)
    @response = Faraday.get "http://api.wunderground.com/api/#{ENV['weather_key']}forecast10day/q/#{zip}.json"
  end


  # def forecast
  #   response = @conn.get("forecast10day/q/#{zip}.json")
  #   b = JSON.parse(response.body)
  # end

end
