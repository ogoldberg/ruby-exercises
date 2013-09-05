class Friend
	def greeting(who = nil, msg = "Hello")		
		!who.nil? ? msg + ", #{who}!" : msg + "!"
	end
end


