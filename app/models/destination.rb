class Destination < ApplicationRecord


  def forecast
    response = WundergroundService.new(zip).to_json
    response.map do |day|
      Forecastday.new(day)
    end
  end
end
