class Timer
  attr_accessor :seconds

  def initialize(value=0)
    @seconds = value
  end

  def seconds
    @seconds
  end

  def time_string
    Time.at(seconds).utc.strftime "%T"
  end

end