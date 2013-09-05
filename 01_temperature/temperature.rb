def ftoc(temp)
	((temp.to_f - 32.0) / 1.8).round
end

def ctof(temp)
	temp * 1.8 + 32
end