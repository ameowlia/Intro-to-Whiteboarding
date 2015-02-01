# This one liner looks simple, but how to determine 
# the time and space complexity?

def remove_duplicates(word)
  word.split("").uniq.join()
end 

#tests
puts remove_duplicates("google") == "gole"
puts remove_duplicates("amelia") == "ameli"


# To determine the time and space compexity I'm 
# going to write each ruby method I used myself
# and analyze their complexities.

def remove_duplicates_2(word)
	# turn string into array
	# equivalent of #split("")
	# time complexity: O(n)
	# space complexity: O(n)
	word_array = []
	word_length = word.length
	counter = 0
	while counter < word_length
		word_array << word[counter]
		counter += 1
	end 

	#remove duplicate chars
	#equivalent of #uniq
	#time complexity: O(n)
	#space complexity: O(n)
	char_freq = Hash.new(0)
	word_array.select! do |char|
		char_freq[char] += 1
		char_freq[char] == 1
	end

	#join array
	#equivalent of #join()
	#time complexity: O(n)
	#space complexity: O(n)
	word_no_dupes = ""
	word_array.each do |char|
		word_no_dupes += char
	end 

	return word_no_dupes
end 

# After adding all of the complexities together, the whole method is: 
# time complexity: O(n)
# space complexity: O(n)


# TESTS
puts remove_duplicates_2("google") == "gole"
puts remove_duplicates_2("amelia") == "ameli"


