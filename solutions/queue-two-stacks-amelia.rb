class Stack 
	def initialize 
		@store = []
	end 

	def peek 
		@store[-1]
	end 

	def pop
		# @store.pop would also work
		@store.delete_at(-1)
	end 

	def push(value)
		# @store.push(value) would also work
		# must concat an array with another array
		@store.concat([value])
	end 

	def is_empty?
		# don't want to use length == 0 becasue 
		# stacks don't have to be arrays
		peek == nil 
	end 
end 

class Queue
	def initialize
		@stack1 = Stack.new
		@stack2 = Stack.new
	end 

	def first
		move_to_stack_2
		@stack2.peek
	end

	def last
		move_to_stack_1
		@stack1.peek
	end

	def enqueue(item)
		move_to_stack_1
		@stack1.push(item)
	end 

	def dequeue
		move_to_stack_2
		@stack2.pop
	end

	def is_empty?
		#check to make sure this works.
		@stack1.is_empty? && @stack2.is_empty?
	end 

	private 

	def move_to_stack_2
		until @stack1.is_empty?
			@stack2.push(@stack1.pop)
		end
	end 

	def move_to_stack_1
		until @stack2.is_empty?
			@stack1.push(@stack2.pop)
		end
	end 
end 


q = Queue.new
puts q.is_empty? == true
q.enqueue(1)
q.enqueue(2)
puts q.first == 1
puts q.last == 2
puts q.dequeue == 1
q.enqueue(3)
puts q.dequeue == 2
puts q.is_empty? == false
puts q.dequeue == 3
puts q.is_empty? == true


