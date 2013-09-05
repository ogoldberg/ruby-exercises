class Book
	attr_accessor :title
		
	def title
		@title.capitalize!
		stopwords = %w{the a an by on for of are with just but and to the my I has some in over under}
		@title = @title.split(" ").map { |word| !stopwords.include?(word) ? word.capitalize : word}.join(" ")
	end
		
end
