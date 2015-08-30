# SeeSaw Array:
# Given a set of numbers, return true or false if there exists a number in the set in which
# the sum of all the numbers to the left of this number is equal to the sum of all the
# numbers to the right of it.
#
# Example:
# [1,1,2,1,1] => true
# [1,2,0,3,0] => true
# [1,2,3,4] => false

# Initial solution. Time: O(n^2), Space O(1)
def seesaw?(arr)
  left_sum = 0
  for i in 0..arr.size-1 do                         #O(n)
    if i > 0
      left_sum = arr[0...i].reduce(:+)              #O(n)
    end
    if i < arr.size-1
      right_sum = arr[i+1..-1].reduce(:+);  #O(n)
    else
      right_sum = 0
    end
    if left_sum == right_sum
      return true
    end
  end
  return false
end

# Refactor Time: O(n), Space O(1)
def seesaw2?(arr)
  left_sum = 0
  right_sum = arr.size > 1 ? arr[1..-1].reduce(:+) : 0

  for i in 0..arr.size-1 do      #O(n)
    return true if left_sum == right_sum
    left_sum += arr[i]
    i < arr.size-1 ? right_sum -= arr[i+1] : right_sum = 0
  end
  return false
end


puts "Initial solution:"
p seesaw?([1,1,2,1,1]) == true
p seesaw?([1,2,0,3,0]) == true
p seesaw?([1,2,3,4])   == false
p seesaw?([0,0,0,4])   == true  # assume elements outside of array are 0.
p seesaw?([0,0,0,0])   == true  # assume elements outside of array are 0.
p seesaw?([1,0,0,0])   == true  # assume elements outside of array are 0.
p seesaw?([0])         == true
p seesaw2?([1])        == true
p seesaw?([])          == false

puts "\nRefactored solution:"
p seesaw2?([1,1,2,1,1]) == true
p seesaw2?([1,2,0,3,0]) == true
p seesaw2?([1,2,3,4])   == false
p seesaw2?([0,0,0,4])   == true
p seesaw?([0,0,0,0])    == true  # assume elements outside of array are 0.
p seesaw?([1,0,0,0])    == true  # assume elements outside of array are 0.
p seesaw2?([0])         == true
p seesaw2?([1])         == true
p seesaw2?([])          == false
