
# The one liner. 
# Combination finds all subsets of a particular size, so this
# iterates from 0 (the smallest subset size possible)to the 
# length of the set (the largest subset size possible) and calls
# combination on the set for each size.

def get_power_set_1(set)
	(0..set.length).map {|i| set.combination(i).to_a}.flatten(1)
end 

puts get_power_set_1([1, 2]) == [[], [1], [2], [1, 2]]
# A set of size n has 2^n subsets. 
puts get_power_set_1([1, 2, 3, 4, 5, 6]).length == 2**(6)


# Another way to think about it 

def get_power_set_2(set)
	return [[]] if set.empty?

	num = set.pop
	previous_subsets = get_power_set_2(set)

	previous_subsets.map do |subset|
		[subset.dup.push(num), subset]
	end.flatten(1)

end 

p get_power_set_2([1, 2]) == [[1, 2], [1], [2], [] ]
# A set of size n has 2^n subsets. 
p get_power_set_2([1, 2, 3, 4]).length == 2**4

