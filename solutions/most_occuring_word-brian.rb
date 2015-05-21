def brute_most_occuring_word(str)
	#brute force
	words = str.split(/[ \?\.\!]/)
	word_count = {}
	words.each do |word|
		unless word_count[word]
			word_count[word] = words.count(word)
		end
	end

	p find_largest_word_count(word_count)

end

def find_largest_word_count(word_count)
	max_count = word_count.values.max
	most_occuring_words = []
	word_count.each do |word, count|
		if count >= max_count 
			most_occuring_words << word
		end 
	end
	most_occuring_words
end

test = "How much wood would a wood chuck chuck if a wood chuck could chuck wood?"
p brute_most_occuring_word(test) == ["wood", "chuck"]