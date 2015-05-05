# Write the method are_anagrams? that takes two strings as arguments and returns true if they are anagrams of each other or false if they are not.

# Explain the time and space complexity of your algorithm.

# Bonus: Can you do it without using the Ruby method #sort?

# SOLUTION

# a) Using Ruby's sort method:
def are_anagrams?(string1, string2)
  return false if string1.length != string2.length
  return string1.chars.sort == string2.chars.sort
end

# b) Time and space complexity:
# 0(n) time and 0(1) space

# c) Bonus: without using the Ruby #sort method

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
