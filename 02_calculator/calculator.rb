def add(a,b)
	a + b
end

def subtract(a,b)
	a - b
end

def sum(array)
	array.inject(0) {|sum, element| sum + element}
end

def multiply(array)
	array.inject(1) {|product, element| product * element}
end

def power(a,b)
	a**b
end

def factorial(n)
	n == 0 ? 1 : (1..n).inject(:*)
end
