// Recursive Factorial Solution

function factorial(num) {
    if (num === 0) return 0
    if (num === 1) return 1
    else return num * factorial(num - 1)
}

console.log(factorial(0)  === 0)
console.log(factorial(4)  === 24)
console.log(factorial(11) === 39916800)
