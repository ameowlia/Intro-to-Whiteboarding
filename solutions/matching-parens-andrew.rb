#Take the input string and split it so that each character is on its own
#Then I want to check each character, and if it's a "(" store a count of that parentheses in some sort of array. I'll do the same for closed parentheses.
#check to make sure that the first parenthesis is open

# If the number of open and closed parentheses are the same, then then it is a valid string

def parens_checker(string)
  each_character_array = string.split("")
  parens_count = Array.new(2){0}
  p parens_count
  each_character_array.each do |x|
    if x == "("
      parens_count[0] += 1
    elsif x == ")" && parens_count[0] == nil
      return false
    elsif x == ")"
      parens_count[1] += 1
    else
      next
    end
  end
  if parens_count[0] == parens_count[1]
    return true
  else
    return false
  end
end

p parens_checker("This is an invalid parens (")
p parens_checker("This one is legit()")
