def make_largest_number(nums)

	# turn numbers into strings
	nums.map!{|num| num.to_s}

	# sort into buckets by first number 
	buckets = sort_into_buckets(nums)

	# sort each bucket
	buckets.map!.with_index {|bucket, i| sort_bucket(bucket, i.to_s)}

	# reverse the order of buckets ( so it's 9-0 not 0-9)
	# flatten all arrays and join into one long number
	buckets.reverse.flatten.join
end 

def sort_into_buckets(nums)
	buckets = Array.new(10).map!{|bucket| []}
	nums.each do |num|
		bucket_index = num[0]
		buckets[bucket_index.to_i] << num
	end 
	return buckets
end 

def sort_bucket(bucket, starting_value)
	# split all strings into arrays
	bucket.map! {|num| num.split("")}

	# find longest number length
	max_length = bucket.map {|num| num.length }.max

	# sort!
	bucket.sort do |a, b|
		potential_num(a, starting_value, max_length) <=> potential_num(b, starting_value, max_length)
	end.reverse

end 

def potential_num(num, starting_value, max_length)
	num = num.dup
	num_length = num.length 
	return num.join().to_i if num_length == max_length

	missing_length = max_length - num_length
	missing_length.times {num << starting_value}
	return num.join().to_i
end


####TESTS


nums = %w(3 30 34 5 9 88)
p make_largest_number(nums) == "988534330"

nums = %w(970 9 9 8 62 1000 3 33 3000 5 30)
p make_largest_number(nums) == "9997086253333030001000"


