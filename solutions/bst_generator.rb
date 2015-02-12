class Node 
	attr_accessor :value, :left_child, :right_child
	def initialize(value)
		@value = value 
		@left_child = nil
		@right_child = nil
	end
end 


def make_BST(size)
	nums = (0..size).to_a.shuffle
	root = Node.new(nums.shift)
	while !nums.empty?
		add_node(root, Node.new(nums.shift))
	end 
	return root
end 

def add_node(root, node)
	if node.value < root.value
		if root.left_child == nil
			# puts "root value: #{root.value} has left child #{node.value}"
			root.left_child = node
			return 
		else 
			add_node(root.left_child, node)
		end
	else
		if root.right_child == nil
			root.right_child = node
			# puts "root value: #{root.value} has right child #{node.value}"
			return 
		else 
			add_node(root.right_child, node)
		end
	end
	return root
end

