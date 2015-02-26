def fill_jars(instructions)
	jar_set = Array.new(instructions.shift, 0)
	sum_of_all_jars = 0

	instructions.each do |instruction|
		(instruction[0]-1..instruction[1]-1).each do |index|
			jar_set[index] += instruction[2]
		end
		
	end


	jar_set.each do |jar|
		sum_of_all_jars += jar
	end

	sum_of_all_jars / jar_set.size

end

test = 

[5,
[1,2,100],
[2,5,100],
[3,4,100]]

p fill_jars(test)
