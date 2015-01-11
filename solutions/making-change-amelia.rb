# Question: https://www.interviewcake.com/question/coin
# Given an amount and a list of coin denominations calculate 
# the number of ways to uniquely create that amount. 


# This example uses recurrsion
# Try to make it better by implimenting memoization 
# To read more about this problem go to the source at 
# https://www.interviewcake.com/question/coin

# Do you understand why the #dup is needed on line 28?

def make_change(amount, denominations)

	return 1 if amount == 0
	return 0 if denominations.empty?

	count = 0 

	coin = denominations.pop

	# the '+1' is becasue I want to it round up 
	# not down (which is what integer division does)
	num_possibilities = (amount / coin) + 1

	num_possibilities.times do |i|
		amount_left = amount - i*coin
		count += make_change(amount_left, denominations.dup)
	end 

	return count

end

#Test
puts make_change(4, [1, 2, 3]) == 4