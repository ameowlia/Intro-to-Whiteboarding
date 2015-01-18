class Node
	attr_accessor :next, :data

	def initialize(data = nil)
		@next = nil
		@data = data
	end
end

class Queue

	def initialize
		@head = nil
		@tail = nil		
	end

	def first
		@head
	end

	def last
		@tail
	end

	def enqueue(node)
		if self.is_empty?
			@head = node
		else
			@tail.next = node			
		end

		@tail = node
	end

	def dequeue
		if @head == @tail
			@tail = nil
			@head = nil
		else
			@head = @head.next
		end
	end

	def is_empty?
		if @tail
			return false
		else
			return true
		end
	end
end

q = Queue.new
osman = Node.new("Osman")
james = Node.new("James")
matilda = Node.new("Matilda")

puts q.is_empty? == true
q.enqueue(osman)
q.enqueue(james)
puts q.first.data == osman.data
puts q.last.data == james.data
q.dequeue
puts q.first.data == james.data
puts q.last.data == james.data
q.enqueue(matilda)
puts q.first.data == james.data
puts q.last.data == matilda.data
q.dequeue 
puts q.is_empty? == false
q.dequeue
puts q.is_empty? == true