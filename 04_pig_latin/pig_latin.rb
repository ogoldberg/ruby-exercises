def translate(phrase)
	phrase.split(" ").map {|word|
		if vowel?(word)
			word = word + 'ay'
		elsif !vowel?(word) and (!vowel?(word[1]) || qu?(word[1..2])) and !vowel?(word[2])
			qu?(word[2..3]) ? sub_letters(word,3) : sub_letters(word,2)
		elsif (!vowel?(word) && !vowel?(word[1])) || word.match(/\A[qu]/)
			qu?(word[1..2]) ? sub_letters(word,2) : sub_letters(word,1)
		else
			sub_letters(word,0)
		end
	}.join(" ")
end

def sub_letters(word,number)
	first_letters = word[0..number]
	word[0..number] = ''
	word = word + first_letters + 'ay'
end

def vowel?(word)
	word.match(/\A[aeiou]/)
end

def qu?(word)
	word[0].match(/q/) && word[1].match(/u/)
end