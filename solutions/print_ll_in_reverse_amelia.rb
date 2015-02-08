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

	def print_in_reverse(node=@head)
		return if node == nil
		print_in_reverse(node.pointer)
		puts node.value
	end

end 

#TEST

#empty linked list prints nothing
ll = LinkedList.new()
ll.print_in_reverse

#works for general use
5.times {|i| ll.add(Node.new(i)); }
ll.print_in_reverse #this should print 0-4 in order

