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

end 


##TESTS
#Node can have a value
node = Node.new(10)
p node.value == 10
#nodes can point to other nodes
other_node = Node.new(20)
node.pointer = other_node
p node.pointer.value == 20

#can add nodes to linked list
ll = LinkedList.new(node)
p ll.head.value == 10
ll.add(other_node)
p ll.head.value == 20

#can remove nodes from linked list
ll.remove
p ll.head.value == 10
