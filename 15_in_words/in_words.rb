module Inwords

  def in_words
    @output = ""
    number = self
    processor(number)
  end

  def processor(number)
    if number == 0
      @output << "zero"
    elsif number < 10
        ones(number)
    elsif number < 20
        teens(number)
    elsif number < 100
      tens(number, number.to_s[0].to_i)
    elsif number < 1000
      big_numbers(number, number/100, number.to_s[1..2], "00")    
    elsif number < 1_000_000 
      big_numbers(number, number/1000, number.to_s[-3..-1], "000" )
    elsif number < 1_000_000_000
      big_numbers(number, number/1_000_000, number.to_s[-6..-1], "000000")
    elsif number < 1_000_000_000_000
      big_numbers(number, number/1_000_000_000, number.to_s[-9..-1], "000000000")
    elsif number < 1_000_000_000_000_000
      big_numbers(number, number/1_000_000_000_000, number.to_s[-12..-1], "000000000000")
    end
    @output
  end

  def ones(number)
    spacer
    ones = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    @output << ones[number]
  end

  def teens(number)
    spacer
    teen_list = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    @output << teen_list[number-10]
  end

  def tens(number, prefix)
    spacer
    tens_list = ["", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety",""]
    @output << tens_list[(number/10)-1]
    tens = [00,20,30,40,50,60,70,80,90]
    if !tens.include?(number)
      processor(number-(prefix * 10))
    end
  end

  def big_numbers(number, prefix, suffix, zeros)
    processor(prefix)
    names = [[" hundred", 100, 999], [" thousand", 1_000, 999_999], [" million", 1_000_000,999_999_999], [" billion", 1_000_000_000,999_999_999_999], [" trillion", 1_000_000_000_000,999_999_999_999_999]]
    names.reverse.each do |name,min,max|
      if number.between?(min,max)
        @output << name
      end
    end
    processor(suffix.to_i) unless (suffix == zeros)
  end

  def spacer
    @output << " " if @output.length > 0
  end
end

class Fixnum
  include Inwords
end

class Bignum
  include Inwords
end
