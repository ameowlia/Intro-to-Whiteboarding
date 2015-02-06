# Implementation of a Linked List in Ruby
# Adapted from a Java implementation taught
# at Colorado State University

# 'for' loops in Ruby are odd, and I went with
# 'whiles' instead... though either could be used

# ==========================

# a node has a value and a reference
class Node
	attr_accessor :value, :next
	def initialize(value)
		@value = value
	end
end

# example of how node's are referenced without a container

first  = Node.new(42)
second = Node.new(-3)
third  = Node.new(17)
fourth = Node.new(9)
first.next  = second
second.next = third
third.next  = fourth

p first

# --------------------------

# our linked list holds our nodes and allows us
# to call us methods/functions on them
class LinkedList
	attr_accessor :head, :size
	
	# initially, there is no 'head' and 
	# the size of the list is 0
	def initialize
		@head = nil
		@size = 0
	end
end

	# if we're adding at beginning, it becomes our 'head'
	# otherwise, iterate through our nodes until we find
	# one that does NOT have a reference and assign accordingly
	def add_to_end(value)
		if @size == 0
			@head = Node.new(value)
			@size += 1
		else
			current = @head
			index = 0
			while index < @size
				current.next = Node.new(value) if current.next == nil
				current = current.next
				index += 1
			end
			@size += 1
		end
	end

	# if index is zero, due bubble sorty thing
	# to re-assign a new head. otherwise, loop
	# through to the index before desired, set 
	# new_node.next to current.next, set current.next
	# to new_node
	def add_at_index(value, index)
		bounds_check(index)
		new_node = Node.new(value)

		if index == 0
			dummy_node = @head
			@head = new_node
			@head.next = dummy_node
		else
			current = @head
			counter  = 0
			while counter < index
				if counter == index - 1
					new_node.next = current.next
					current.next = new_node
				end
				current = current.next
				counter += 1
			end
		end
		@size += 1
	end

	# if we remove the head, we simply assign
	# head to head's reference. otherwise, set our current.next
	# to current.next.next, skipping over the no longer
	# needed node
	def remove_at_index(index)
		bounds_check(index)

		if index == 0
			@head = @head.next
		else
			current = @head
			counter = 0
			while counter < index
				current.next = current.next.next || nil if counter == index - 1					
				counter += 1
			end
		end
		@size -= 1
	end

	# have 2 counters working in opposite directions
	# the decrement acts as the pointer in one direction
	# effectively saying "stop here and print"
	# while we only print when we get to our 2nd pointer
	def reverse_print
		decrement = 0

		until decrement == @size + 1
			current = @head
			index = 0
			while index < @size
				puts "#{current.value}" if index == @size - decrement
				return if index >= @size
				index += 1
				current = current.next
			end

			decrement += 1
		end
	end

	# start with 'head', print its value
	# and then move onto the next node
	# if the next node is nil, we're done
	def print_list
		current = @head
		index = 0
		while index < @size
			print "#{current.value} -> "
			current = current.next
			index += 1
			if current == nil
				puts "nil"
				index += 1
			end
		end
	end

	# helper method to check index
	def bounds_check(index)
		raise "Sorry, there's nothing in our Linked List" if @size == 0
		raise "Sorry, the index you provided is invalid" if index < 0 || index > @size
	end
end

# ==========================

linked = LinkedList.new
linked.add_to_end("a")
linked.add_to_end("b")
linked.add_to_end("c")
# linked.print_list
# p linked.head

# linked.reverse_print

# linked.add_at_index("d", 0)
# linked.print_list

# linked.add_at_index("e", 1)
# linked.print_list

# linked.add_at_index("f", 2)
# linked.print_list

# linked.remove_at_index(1)
# linked.print_list



























