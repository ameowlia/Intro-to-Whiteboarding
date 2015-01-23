// Visulization 

function fibonacciVisualization(n, spaces) {
    var indent = "";
    for (var i = 0; i < spaces; i++)
        indent += " ";

    console.log(indent + "fibonacci(" + n + ")");
    
    if (n < 2)
        return 1;
    else
        return fibonacciVisualization(n - 2, spaces + 4) + fibonacciVisualization(n - 1, spaces + 4);
}

console.log(fibonacciVisualization(4, 0));
