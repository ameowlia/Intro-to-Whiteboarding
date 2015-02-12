class DictionaryTree 
	attr_accessor :root
	def initialize
		@root = Node.new("")
	end 

	def add_word(word, root=@root)
		first_letter = word[0]
		first_letter_index = letter_index(first_letter)

		if first_letter_index == 0
			root.children[0] = true

		elsif root.children[first_letter_index]
			add_word(word[1..-1], root.children[first_letter_index])

		else 
			root.children[first_letter_index] = Node.new(first_letter)
			add_word(word[1..-1], root.children[first_letter_index])
		end
	end 

	def does_word_exist?(word, root=@root)
		first_letter = word[0]
		first_letter_index = letter_index(first_letter)

		if first_letter_index == 0
			return root.children[0] != nil

		elsif root.children[first_letter_index]
			does_word_exist?(word[1..-1], root.children[first_letter_index])

		else 
			return false
		end
	end 

	private 
	def letter_index(letter)
		return 0 if letter == nil
		letter.downcase.ord - 96
	end 
end 

class Node
	attr_accessor :value, :children
	def initialize(value=nil)
		@value = value
		@children=Array.new(27, nil)
	end
end


dict = DictionaryTree.new()
dict.add_word("amelia")
p dict.does_word_exist?("amelia") == true
p dict.does_word_exist?("algorithms") == false
p dict.does_word_exist?("a") == false

