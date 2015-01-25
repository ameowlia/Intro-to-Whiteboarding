# Recursive Factorial Solution

# Ex. Factorial of 4, expressed 4!, would be calculated as follows:
#  4 * 3 * 2 * 1  => 24

def factorial num
    # Guard clause
    return 0 if num === 0
    num === 1 ? 1 : num * factorial( num - 1 )
end

puts factorial( 0 )  === 0
puts factorial( 4 )  === 24
puts factorial( 11 ) === 39916800
