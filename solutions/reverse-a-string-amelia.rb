# question:
# Write a function to reverse a string in place.


def reverse(str)

	len = str.length

	(len/2).times do |i|
		str[i], str[-1-i] = str[-1-i], str[i]
	end 

	return str
end 


# test
puts reverse("algorithms") == "smhtirogla"
