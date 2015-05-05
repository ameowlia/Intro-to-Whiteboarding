# Is Prime?
# Write the method is_prime? that takes one integer as an argument and returns true if the integer is a prime. Do not use the Ruby method #prime? .

# Explain the time and space complexity of your algorithm.

# Hint: A number is prime if it is an integer greater than one that has no positive divisors other than 1 and itself.

# Examples:

# is_prime?(2) #=> true
# is_prime?(6) #=> false
# Bonus: Can you improve your algorithm by memoizing it?

# SOLUTION
# A) is_prime?
# PSEUDOCODE:
# is_prime? takes a number as input, which we want to check whether it is prime or not.
# We return false if number is < 2
# We iterate from 2 upto the square root of number (included). If we incounter an integer for which the input
# is divisibe by, we return false. Otherwise we return true

# WHY upto square root of number?
# if a number n = a*b and 1 < a <= b, then a^2 <= ab <= b^2
# therefore a^2 <=n <= b^2, then a <=sqrt(n) <= b
# there has to be a prime factor till sqrt(n) if n is composite. if there is no prime factor till sqrt(n), n is itself a prime.
def is_prime?(number)
  return false if number < 2
  i = 2
  while i <= Math.sqrt(number) # See below why we stop at square root of number
    return false if number % i == 0
    i += 1
  end
  true
end

# TEST DRIVE:
p is_prime?(2) == true
p is_prime?(-4) == false
p is_prime?(11) == true
p is_prime?(97) == true