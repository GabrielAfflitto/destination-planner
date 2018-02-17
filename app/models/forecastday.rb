class Forecastday
  attr_reader :date, :high, :low, :condition
  def initialize(day)
    @date = Date.parse(day["date"]["pretty"])
    @high = day["high"]["fahrenheit"]
    @low = day["low"]["fahrenheit"]
    @condition = day["conditions"]
  end

end
