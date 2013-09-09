class Array
  def sum
    result = 0
    collect { |num| result += num }
    result
  end

  def square
    collect { |num| num = num * num }
  end

  def square!
    collect! { |num| num = num * num }
  end

end