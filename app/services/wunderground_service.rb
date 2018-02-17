class WundergroundService

  def initialize
    @conn = Faraday.new(url: "http://api.wunderground.com/api/#{ENV['weather_key']}") do |faraday|
      faraday.headers['Accept'] = 'application/json'
      faraday.adapter  Faraday.default_adapter
    end
    end

  end


  def forecast
    response = @conn.get("forecast10day/q/CA/San_Francisco")
    b = JSON.parse(response.body)
  end

end
