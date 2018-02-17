class Destination < ApplicationRecord


  def forecast
    @response = Faraday.get "http://api.wunderground.com/api/#{ENV['weather_key']}/forecast10day/q/#{zip}.json"
    b = JSON.parse(@response.body)["forecast"]["simpleforecast"]["forecastday"]
    b.map do |day|
      Forecastday.new(day)
    end
    # binding.pry
  end
end
