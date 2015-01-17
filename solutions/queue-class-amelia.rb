class Queue
	def initialize
		@store = []
	end 

	def first
		@store[0]
	end

	def last
		@store[-1]
	end

	def enqueue(item)
		@store.push(item)
	end 

	def dequeue
		@store.shift
	end

	def is_empty?
		#check to make sure this works.
		first == nil 
	end 
end 

# Tests

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