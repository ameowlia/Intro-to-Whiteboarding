# Question: https://www.interviewcake.com/question/word-cloud
# Read in a paragraph and make a word frequency hash

def make_world_cloud(paragraph)

	# remove all punctuation 
	standard_punctuation = %w(. , " ( ) ! ? - )

	standard_punctuation.each do |punctuation|
		paragraph = paragraph.gsub(punctuation, " ")
	end

	# turn into an array of lowercase words
	paragraph = paragraph.downcase.split(" ")

	# create word frequency hash
	word_cloud = Hash.new(0)
	paragraph.each do |word|
		word_cloud[word] += 1
	end

	return word_cloud

end 

# Test
paragraph = "Hello, hello. My name is Amelia."
word_cloud = {"hello"=>2, "my"=>1, "name"=>1, "is"=>1, "amelia"=>1}

puts make_world_cloud(paragraph) == word_cloud
