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


# TEST
p are_anagrams?("dbc", "cdb") == true
p are_anagrams?("dbc", "pizzarules") == false