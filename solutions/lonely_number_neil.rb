def lonely_number(numbers)
	number_frequencies = Hash.new(0)
	loneliest_number = nil
	numbers.each do |number|
		number_frequencies[number] += 1
	end
	
	number_frequencies.each_pair do |number, frequency|
		loneliest_number = number if frequency == 1
	end

	loneliest_number
end


test = [2,6,3,8,6,2,3]
p lonely_number(test)
