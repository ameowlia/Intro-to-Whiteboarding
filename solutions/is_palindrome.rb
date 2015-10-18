def palindrome?(string)
  string.upcase!
  is_palindrome_check(string)
end

# O(n)
def is_palindrome_check(string)
  return true if string.length <= 1

  if string[0] == string[-1]
    string = string[1..-2]
    is_palindrome_check(string)
  else
    return false
  end
end

# Driver code:
p palindrome?("") == true
p palindrome?("a") == true
p palindrome?("ab") == false
p palindrome?("abc") == false
p palindrome?("bob") == true
p palindrome?("hugh") == false
p palindrome?("racecar") == true
p palindrome?("abcdefghijklmnopqrstuvwxyz") == false
p palindrome?("1") == true
p palindrome?("-1") == false
p palindrome?("151") == true
