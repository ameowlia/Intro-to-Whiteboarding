// Recursive Fibonacci Solution

function fibonacci(n) {
    if (n <= 1) return n
    else return fibonacci(n - 1) + fibonacci(n - 2)
}

// Test Cases
console.log(fibonacci(0)  === 0)
console.log(fibonacci(1)  === 1)
console.log(fibonacci(2)  === 1)
console.log(fibonacci(6)  === 8)
console.log(fibonacci(10) === 55)
console.log(fibonacci(16) === 987)
