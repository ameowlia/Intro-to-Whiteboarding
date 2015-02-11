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
		if size == 0
			@head = Node.new(value)
			@size += 1
		else



	end

	def add_at_index(value, index)
		if size == 0
			@head = Node.new(value)
			@size += 1
		end
	end

end