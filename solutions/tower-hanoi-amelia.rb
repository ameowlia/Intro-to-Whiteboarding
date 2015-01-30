# sets up the stacks based on the size
# starts either the even or odd hanoi solution
# returns the required number of steps

def hanoi(size)
	a = (1..size).to_a.reverse
	b = []
	c = []

	if a.length.odd?
		steps = hanoi_odd(a, b, c)
	else 
		steps = hanoi_even(a, b, c)
	end 
	return steps
end 

# After struggling for an hour, I looked up 
# the algorithm below on wikipedia
	# For an even number of disks:
	# make the legal move between pegs A and B
	# make the legal move between pegs A and C
	# make the legal move between pegs B and C
	# repeat until complete

def hanoi_even(a, b, c)
	total_length = a.length
	steps = 0

	until c.length == total_length

		case steps % 3
		when 0
			move(a, b)
		when 1
			move(a, c)
		when 2
			move(b, c)
		end 
		steps += 1

		#comment this out if you dont want to see puts-s 
		#after every move
		log(a, b, c) 
	end 
	return steps
end


# Again, from wikipedia: 
	# For an odd number of disks:
	# make the legal move between pegs A and C
	# make the legal move between pegs A and B
	# make the legal move between pegs C and B
	# repeat until complete


def hanoi_odd(a, b, c)
	total_length = a.length
	steps = 0
	until c.length == total_length

		case steps % 3
		when 0
			move(a, c)
		when 1
			move(a, b)
		when 2
			move(c, b)
		end 
		steps += 1

		log_towers(a, b, c)
	end
	return steps 
end



# This method takes in two towers and moves the 
# apprpriate element from one tower to the other
# depending on the size of the element
def move(tower1, tower2)
	tower1_top = tower1[-1]
	tower2_top = tower2[-1]

	# check if either are nil before doing comparisons
	return tower1 << tower2.pop if tower1_top == nil
	return tower2 << tower1.pop if tower2_top == nil

	# compare size of elements
	return tower1 << tower2.pop if tower1_top > tower2_top
	return tower2 << tower1.pop if tower1_top < tower2_top
end


# Shows what elements are in what tower
def log(a, b, c)
	puts "tower a: "
	p a
	puts "tower b: "
	p b
	puts "tower c: "
	p c
	puts "*"*20
end 


######################################### tests
(1..5).each do |n|
	puts hanoi(n) == (2**n - 1)
end


