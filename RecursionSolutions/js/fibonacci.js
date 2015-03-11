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

// function fibonacciVisualization(n, spaces) {
//     var indent = "";
//     for (var i = 0; i < spaces; i++)
//         indent += " ";

//     console.log(indent + "fibonacci(" + n + ")");
    
//     if (n < 2)
//         return 1;
//     else
//         return fibonacciVisualization(n - 2, spaces + 4) + fibonacciVisualization(n - 1, spaces + 4);
// }

// console.log(fibonacciVisualization(7, 0));
