def measure(number = 1)
	elapsed_times = []
	number.times do		
		start_time = Time.now
		yield
		elapsed_times << Time.now - start_time
	end
	elapsed_time = elapsed_times.inject{|sum, x| sum + x}/elapsed_times.count
end
