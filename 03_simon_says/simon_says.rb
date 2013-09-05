def echo(phrase)
	phrase
end

def shout(phrase)
	phrase.upcase
end

def repeat(phrase, number = 2)
	((phrase + " ") * number).strip
end

def start_of_word(word, number)
	word[0..number-1]
end

def first_word(phrase)
	phrase.split.first
end

def titleize(phrase)
	stopwords = %w{the a by on for of are with just but and to the my I has some in over under}
	phrase = phrase.split(" ").map { |word| !stopwords.include?(word) ? word.capitalize : word}.join(" ")
	phrase[0] = phrase[0].capitalize
end
