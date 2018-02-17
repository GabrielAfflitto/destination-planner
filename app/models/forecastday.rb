class Forecastday
  attr_reader :date, :high, :low, :condition, :weekday
  def initialize(day = {})
    @weekday = day[:date][:weekday]
    @date = day[:date][:pretty]
    @high = day[:high][:fahrenheit]
    @low = day[:low][:fahrenheit]
    @condition = day[:conditions]
  end

end
