# Recursive Fibonacci Solution

def fibonacci n
    n <= 1 ? n : fibonacci( n - 1) + fibonacci(n - 2)
end

# Test Cases
puts fibonacci(0)  === 0
puts fibonacci(1)  === 1
puts fibonacci(2)  === 1
puts fibonacci(6)  === 8
puts fibonacci(10) === 55
puts fibonacci(16) === 987
