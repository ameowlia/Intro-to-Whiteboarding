def matching_parens(str)
	counter = 0
	str.split("").each do |char|
		counter+= 1 if char == "("
		counter-= 1 if char == ")"
		return false if counter < 0
	end 

	return counter == 0

end 

puts matching_parens("(sdd)") == true
puts matching_parens("(sdd))") == false
