class Node
	attr_accessor :value, :pointer
	def initialize(value=nil, pointer=nil)
		@value = value
		@pointer = pointer
	end
end 

class LinkedList
	attr_accessor :head
	def initialize(head=nil)
		@head = head
	end

	def add(node) #always at the beginning
		node.pointer = @head
		@head = node
	end

	def remove #always at the beginning
		@head = @head.pointer if @head != nil
	end

	def add_at_index(node, index)
		if index == 0
			node.pointer = @head
			@head = node
			return
		end

		current = iterate_until{|current, counter| counter == index-1}
		node.pointer = current.pointer
		current.pointer = node
	end

	def remove_at_index(index)
		if index == 0
			remove_node = @head
			@head = @head.pointer
			return remove_node.value
		end 

		current = iterate_until{ |current, counter| counter == index-1;}
		remove_node = current.pointer
		current.pointer = current.pointer.pointer
		return remove_node.value
	end

	def value_at_index(index)
		counter = 0
		current = @head 
		current = iterate_until{ |current, counter| current == nil || counter == index}
		return current ? current.value : nil
	end

	def size
		current = iterate_until{ |current, counter| return counter if current == nil }
		# counter = 0
		# current = @head 
		# while current != nil 
		# 	current = current.pointer
		# 	counter += 1
		# end 
		# return counter
	end 

	private 

	def iterate_until
		current = @head
		counter = 0
		until yield(current, counter)
			current = current.pointer
			counter += 1
		end 
		return current
	end
end 


##TESTS

#adds to an empty linked LinkedList
ll = LinkedList.new()
ll.add_at_index(Node.new(0), 0)
p ll.value_at_index(0) == 0

#adds to the end of the list
ll.add_at_index(Node.new(1), 1)
p ll.value_at_index(1) == 1

#adds to the middle of the list
ll.add_at_index(Node.new(2), 1)
p ll.value_at_index(1) == 2

#adds to front of list
ll.add_at_index(Node.new(3), 0)
p ll.value_at_index(0) == 3

#can remove from middle
init_value = ll.value_at_index(1)
init_size = ll.size
p ll.remove_at_index(1) == init_value
p ll.size == init_size -1

#can remove from beginning
init_value = ll.value_at_index(0)
init_size = ll.size
p ll.remove_at_index(0) == init_value
p ll.size == init_size -1

#can remove from end
init_size = ll.size
init_value = ll.value_at_index(init_size-1)
p ll.remove_at_index(init_size-1) == init_value
p ll.size == init_size -1

#can remove only item in linked list
init_size = ll.size
init_value = ll.value_at_index(0)
p ll.remove_at_index(0) == init_value
p ll.size == 0

p ll.value_at_index(5) == nil
