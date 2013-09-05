def reverser
	yield.split(" ").map {|word| word.reverse}.join(" ")
end

def adder(number = 1)
	yield + number
end

def repeater(number = 1)
	number.times {yield}
end