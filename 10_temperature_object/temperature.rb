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

  # def in_fahrenheit(temp)
  #   if temp = @f
  #     return @f
  #   elsif temp = @c
  #     return temp * 1.8 + 32
  #   end
  # end  
    

  # end


  def self.from_celsius(temp)
    @c = temp
    in_celsius     
  end

    
end