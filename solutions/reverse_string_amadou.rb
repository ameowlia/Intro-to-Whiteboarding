# Write a function to reverse a string in place. "In place" means "without creating a new string in memory."

# Solution

# PSEUDOCODE
# We return the string itself if its length is less than 2
# We define 2 variables, i and j; i starts at 0 and j start at the end of the input string (string length - 1)
# We iterate as long as i is less than or equal to j.
# We swap the values of the string at position i and j.
# We then increment i and decrement j

def reverse(string)
  len = string.length
  return string if len < 2
  i = 0
  j = len - 1
  while i <= j
    # swap string[i] with string[j]
    temp = string[i]
    string[i] = string[j]
    string[j] = temp
    # Increment i and decrement j
    i += 1
    j -= 1
  end
  string
end

# TEST DRIVE
p reverse("") == ""
p reverse("a") == "a"
p reverse("Hi") == "iH"
p reverse("I love programming") == "gnimmargorp evol I"
