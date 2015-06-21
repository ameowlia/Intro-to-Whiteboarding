def is_palindrome?(sentence)
	return true if sentence.length == 0 

	sentence = clean_string(sentence).split("") if sentence.class == String

	if sentence[0] == sentence[-1]
		return is_palindrome?(sentence[1...-1])
	else
		return false
	end 
end 

def clean_string(sentence)
	sentence.downcase.gsub(/\W+/, '')
end 

# TESTS

p is_palindrome?("amelia") == false
p is_palindrome?("algorithms") == false
p is_palindrome?("hogwarts strawgoh") == true
p is_palindrome?("racecar")  == true

# it shouldn't care about punctuation
p is_palindrome?("r(aCe)c      A!!! r.")  == true