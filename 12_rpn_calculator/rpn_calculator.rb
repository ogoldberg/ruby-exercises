class RPNCalculator
  attr_accessor :input_array

  def initialize
    @input_array = [0]
  end

  def value
    return input_array[input_array.length - 1]
  end

  def push(value)
    input_array.push(value.to_f)
  end

  def plus
    input_array.push(pop + pop)
  end

  def minus
    old_value = pop
    input_array.push(pop - old_value)
  end

  def divide
    old_value = pop
    input_array.push(pop / old_value)
  end

  def times
    input_array.push(pop * pop)
  end

  def pop
    value = input_array.pop
    raise "calculator is empty" if value.nil?
    return value
  end

  def tokens(string)
    string.split.map do |token|
      case token
      when '+', '-', '/', '*'
        token.to_sym
      else
        token.to_f
      end
    end
  end

  def evaluate(string)
    tokens(string).each do |token|
      if token == :+
        plus
      elsif token == :-
        minus
      elsif token == :/
        divide
      elsif token == :*
        times
      else
        push token
      end
    end
    value
  end
end