def find_permutations(letters_left, word_so_far=[])
	letters_left = letters_left.split("") if letters_left.class == String
	return word_so_far.join() if letters_left.empty?

	letters_left.map.with_index do |letter, i|
		letters_left_dup = letters_left.dup
		letters_left_dup.delete_at(i)
		word_so_far_dup = word_so_far.dup << letter
		find_permutations(letters_left_dup, word_so_far_dup)
	end.flatten 
end 

p find_permutations("dogs").count == 24
p find_permutations("a").count == 1
p find_permutations("algorithms").count == 3628800 
