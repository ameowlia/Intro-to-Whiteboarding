def reverse_string(str)
	string_length = str.length
	
	#loop through string
	#replace the current indexed char with its respective one near the end
	#stop in the middle

	index = 0
	reverse_index = -1

	while index < (string_length / 2)
		current_char = str[index]
		temp = current_char
		str[index] = str[reverse_index]
		str[reverse_index] = temp

		index += 1
		reverse_index -= 1
 	end
 	puts str
end

reverse_string("abc")
reverse_string("hello")
reverse_string("abcd")
