def magic_number(numbers)
	nums_right = sum_of(numbers[1..-1])
	nums_left  = 0

	numbers.each_with_index do |number, index|
		return true if nums_right == nums_left

		nums_left += number
		if numbers[index+1] == nil #i'm at the last number
			nums_right = 0
		else
			nums_right -= numbers[index+1]
		end
	end
	return false
end


def sum_of(num_array)
	sum = 0
	num_array.map {|num| sum += num}.last
end



test = [1,10,2,5,6,9,4,1,4,8,14,6]

p magic_number(test) 