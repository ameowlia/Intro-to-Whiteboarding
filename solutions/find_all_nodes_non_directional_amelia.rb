# The first bit of this code is set up so I can test
# my algorithsm

class Node 
	attr_accessor :neighbors, :value, :visited
	def initialize(value)
		@value = value 
		@neighbors = []
		@visited = false
	end 
end 


# This will make a non-directional graph of a certain
# size, there is a reasonable chance that the graph 
# will not be connected. (that is the graph you have 
# access to from the returned node is not the size that 
# you entered)
def create_graph(num_nodes)
	nodes = []
	values = (0...num_nodes).to_a.shuffle
	num_nodes.times do 
		nodes << Node.new(values.pop)
	end
	
	nodes.each do |node|
		until node.neighbors.length >=2 
			neighbor = nodes.sample
			if neighbor != node && !node.neighbors.include?(neighbor)
				node.neighbors << neighbor 
				neighbor.neighbors << node
			end
		end
	end
	return nodes[0]
end

root1 = create_graph(10)
root2 = create_graph(10)


#### END OF SET UP ####



def return_values_breadth_first(root)
	nodes = [root]
	values = []
	while !nodes.empty?
		current = nodes.shift 
		if !current.visited
			values << current.value 
			current.visited = true
			current.neighbors.each do |node|
				nodes << node if !node.visited 
			end 
		end
	end 
	return values
end 

def return_values_depth_first(root)
	values = []
	return values if root.visited 
	root.visited = true

	root.neighbors.each do |node|
		values.concat(return_values_depth_first(node))
	end
	return values.push << root.value
end 

#TESTS
depth_values = return_values_depth_first(root1).sort 
breadth_values = return_values_breadth_first(root2).sort

#This test will be true most of the time. 
#Occasionally, the graphs are not connected.
p depth_values == breadth_values
