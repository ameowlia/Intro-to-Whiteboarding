
def is_prime?(num)
  return false if num < 2
  return true if num < 4
  return false if num.even? 
  highest_possible_factor = Math.sqrt(num)
  # if they are larger than the sqrt of num, they are redundant
  for factor in 2..highest_possible_factor
    false if num%factor == 0 
  end
  true
end

p is_prime?(2) == true
p is_prime?(6) == false
p is_prime?(541) == true #big prime
p is_prime?(461) == true #big prime
p is_prime?(542) == false