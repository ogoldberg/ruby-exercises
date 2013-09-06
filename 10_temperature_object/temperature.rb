class Temperature

  def initialize(opts={})
    temp = opts.each { |k,v| instance_variable_set("@#{k}", v) }
  end

  def metric_selector(temp)
    if !@f.nil?
      from_fahrenheit(temp)
    elsif !@c.nil?
      from_celsius(temp)
    end
  end

  def from_fahrenheit(temp)
    in_fahrenheit
  end

  def in_fahrenheit
    @f ? @f : @c * 1.8 + 32
  end

  def in_celsius
    @c ? @c : ((@f-32)*5)/9
  end

  def self.from_celsius(temp)
    Temperature.new(:c => temp)    
  end

  def self.from_fahrenheit(temp)
    Temperature.new(:f => temp)
  end    
end

class Celsius < Temperature
  def initialize(temp)
    @c = temp
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    @f = temp
  end
end