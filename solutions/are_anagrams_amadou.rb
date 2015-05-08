# Write the method are_anagrams? that takes two strings as arguments and returns true if they are anagrams of each other or false if they are not.

# Explain the time and space complexity of your algorithm.

# Bonus: Can you do it without using the Ruby method #sort?

# SOLUTION

# a) Using Ruby's sort method:
# PSEUDOCODE
# We return false if the 2 strings have different lengths
# We split each input string, sort the arrays that result from the string splitting, and compare the 2 sorted arrays.

def are_anagrams?(string1, string2)
  return false if string1.length != string2.length
  return string1.chars.sort == string2.chars.sort
end

# b) Time and space complexity:
# 0(n) time and 0(1) space

# c) Bonus: without using the Ruby #sort method

# PSEUDOCODE
# We return false if the 2 strings have different lengths
# We define a hash with default value of 0
# We add to the hash each character from the 1st input string
# We iterate through the 2nd input string, and for each character in it, we return false if the hash
# value of that character is less than 1; otherwise, we decrement it by 1
# We iterate through the hash and return false if any of the values is not 0
# We return true at the end

def are_anagrams_2?(string1, string2)
  return false if string1.length != string2.length
  hash = Hash.new(0)
  string1.chars.each {|character| hash[character] += 1}
  string2.chars.each do |letter|
    return false if hash[letter] < 1
    hash[letter] -= 1
  end
  hash.each_value {|v| return false if v != 0}
  true
end


# TEST
p are_anagrams?("dbc", "cdb") == true
p are_anagrams?("dbc", "pizzarules") == false

p are_anagrams_2?("dbc", "cdb") == true
p are_anagrams_2?("dbc", "pizzarules") == false
