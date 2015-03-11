class Stack 
	def initialize 
		@store = []
	end 

	def peek 
		@store[-1]
	end 

	def pop
		# @store.pop would also work
		@store.delete_at(-1)
	end 

	def push(value)
		# @store.push(value) would also work
		# must concat an array with another array
		@store.concat([value])
	end 

	def is_empty?
		# don't want to use length == 0 becasue 
		# stacks don't have to be arrays
		peek == nil 
	end 
end 

######

def valid_parens(str)

	parens = Stack.new

	str.split("").each do |char|
		if is_open_paren?(char)
			parens.push(char) 
		elsif is_close_paren?(char)
			return false if !matching_parens?(parens.pop, char)
		end 
	end 

	return parens.is_empty?

end 

# Helper Functions
def is_open_paren?(char)
	["(", "{", "["].include?(char)
end 

def is_close_paren?(char)
	[")", "}", "]"].include?(char)
end 

def matching_parens?(open, close)
	return true if open == '(' && close ==')'
	return true if open == '{' && close =='}'
	return true if open == '[' && close ==']'

	return false
end 


# Tests

puts valid_parens("(hello)my{name}is[amelia()]") == true
puts valid_parens("(hello)my{name}is[amelia()]{") == false



