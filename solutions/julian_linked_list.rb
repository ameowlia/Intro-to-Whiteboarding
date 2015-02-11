class Node

	attr_accessor :value, :pointer
	def initialize(value)
		@value = value
	end

end

class LinkedList

	attr_accessor :head, :size

	def initialize
		@head = nil
		@size = 0
	end

	def add_node_to_list(value)
		if @head == nil
			@head = Node.new(value)
			@size += 1
		else
			current_node = @head
			index = 0
			while index < @size
				if current_node.pointer == nil
				current_node.pointer = Node.new(value)
				else
					index += 1
				end
			end
				@size += 1
		end
	end


	def printOutLinkList
		index = 0
		current_node = @head
		while current_node != nil
			p "index: #{index} value: #{current_node.value}"
			current_node = current_node.pointer
			index += 1
		end
	end


end



myList = LinkedList.new



myList.add_node_to_list(2)

myList.add_node_to_list(3)

myList.printOutLinkList

