# Write a function to reverse a string in place. "In place" means "without creating a new string in memory."

# Solution

def reverse(string)
  len = string.length
  return string if len < 2
  i = 0
  j = len - 1
  while i < j
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
